class Games < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :title
      t.string :venue
      t.integer :players_required
      t.string :cost
      t.text :special_requirements
      t.datetime :date_time
      t.integer :host_id
      t.references :category_id

      t.timestamps
    end
  end
end