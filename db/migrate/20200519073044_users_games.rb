class UsersGames < ActiveRecord::Migration[6.0]
  def change
    create_table :users_games do |t|
      t.references :user
      t.references :game

      t.timestamps
    end
  end
end