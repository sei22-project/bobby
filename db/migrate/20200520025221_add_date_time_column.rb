class AddDateTimeColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :end, :datetime
    rename_column :games, :date_time, :start
  end
end