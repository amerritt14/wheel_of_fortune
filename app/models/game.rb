# frozen_string_literal: true

class Game < ApplicationRecord
  belongs_to :puzzle

  before_validation :set_puzzle

  private

  def set_puzzle
    self.puzzle ||= Puzzle.all.sample
  end
end
