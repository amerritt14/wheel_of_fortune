# frozen_string_literal: true

class AddTurnsToRound < ActiveRecord::Migration[5.2]
  def change
    add_column :rounds, :current_player_id, :bigint
  end
end
