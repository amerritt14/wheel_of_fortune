# frozen_string_literal: true

class Game < ApplicationRecord
  delegate :phrase, to: :puzzle

  belongs_to :puzzle
  has_many :guesses, dependent: :destroy

  before_validation :set_puzzle

  attr_accessor :guessed_letter

  def phrase_after_guesses
    phrase.upcase.split("").map do |letter|
      next letter unless is_letter?(letter)

      if guessed_letters.include?(letter)
        letter
      else
        "_"
      end
    end.join("")
  end

  def words_after_guesses
    phrase_after_guesses.split(/(?<=[ ])\s*/).map{ |word| word.split("") }
  end

  def guessed_letters
    guesses.pluck(:letter).uniq.map(&:upcase)
  end

  def make_guess(letter)
    Guess.create(letter: letter, game: self)
  end

  # returns 0 if true, nil if false
  def is_letter?(letter)
    letter =~ /[[:alpha:]]/
  end


  private

  def set_puzzle
    self.puzzle ||= Puzzle.all.sample
  end
end
