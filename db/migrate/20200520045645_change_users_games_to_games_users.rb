class ChangeUsersGamesToGamesUsers < ActiveRecord::Migration[6.0]
  def change
    rename_table :users_games, :games_users
  end
end