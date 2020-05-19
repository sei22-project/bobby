class ChangeColumnNameGamesAgain < ActiveRecord::Migration[6.0]
  def change
    rename_column :games, :category, :category_id
  end
end