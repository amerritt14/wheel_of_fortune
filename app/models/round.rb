# frozen_string_literal: true

class Round < ApplicationRecord
  delegate :phrase, to: :puzzle

  belongs_to :game
  belongs_to :puzzle

  has_one :current_player, class_name: "Player"

  has_many :guesses, dependent: :destroy
  has_many :players, through: :game

  before_validation :set_puzzle

  validate :ensure_current_player_belongs_to_game

  attr_accessor :guessed_letter

  def phrase_after_guesses
    phrase.upcase.split("").map do |letter|
      next letter unless letter?(letter)

      if guessed_letters.include?(letter)
        letter
      else
        "_"
      end
    end.join("")
  end

  def words_after_guesses
    phrase_after_guesses.split(/(?<=[ ])\s*/).map { |word| word.split("") }
  end

  def guessed_letters
    guesses.pluck(:letter).uniq.map(&:upcase)
  end

  def make_guess(letter)
    Guess.create(letter: letter, round: self)
  end

  # returns 0 if true, nil if false
  def letter?(letter)
    letter =~ /[[:alpha:]]/
  end

  def next_player_id
    find_next_player
  end

  private

  def ensure_current_player_belongs_to_game
    return if current_player_id.in?(players.pluck(:id) || current_player_id.blank?)

    errors.add(:current_player_id, "Current player must belong to game.")
  end

  def set_puzzle
    self.puzzle ||= Puzzle.all.sample
  end

  def player_ids
    @player_ids ||= players.pluck(:id).cycle
  end

  def find_next_player
    loop do
      break if player_ids.next == current_player_id
    end
    player_ids.next
  end
end
