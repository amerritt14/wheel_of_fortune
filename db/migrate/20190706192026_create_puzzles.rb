# frozen_string_literal: true

class CreatePuzzles < ActiveRecord::Migration[5.2]
  def change
    create_table :puzzles do |t|
      t.string :phrase

      t.timestamps
    end
  end
end
