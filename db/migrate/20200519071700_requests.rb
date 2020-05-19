class Requests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.references :user
      t.references :game
      t.integer :status
    end
  end
end