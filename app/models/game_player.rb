# frozen_string_literal: true

class GamePlayer < ApplicationRecord
  belongs_to :game
  belongs_to :player

  validates_uniqueness_of :player_id, scope: :game_id
end
