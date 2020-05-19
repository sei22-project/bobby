class ChangeColumnNameCategory < ActiveRecord::Migration[6.0]
  def change
    rename_column :categories, :type, :game_type
  end
end