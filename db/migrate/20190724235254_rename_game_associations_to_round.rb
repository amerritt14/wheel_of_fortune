class RenameGameAssociationsToRound < ActiveRecord::Migration[5.2]
  def change
    rename_column :guesses, :game_id, :round_id
  end
end
