# frozen_string_literal: true

class Puzzle < ApplicationRecord
  has_many :games

  validates_presence_of :phrase
end
