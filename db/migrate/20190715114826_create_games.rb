class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.timestamps
    end

    add_column :rounds, :game_id, :bigint
  end
end
