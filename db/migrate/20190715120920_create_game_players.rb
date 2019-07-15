# frozen_string_literal: true

class CreateGamePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :game_players do |t|
      t.references :player
      t.references :game

      t.timestamps
    end
  end
end
