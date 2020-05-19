class ChangeColumnNameGames < ActiveRecord::Migration[6.0]
  def change
    rename_column :games, :category_id_id, :category
  end
end