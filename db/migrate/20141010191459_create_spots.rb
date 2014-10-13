class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.belongs_to :user
      t.string :name, null: false
      t.string :address, null: false
      t.string :phone, null: false
      t.string :website
      t.integer :price
      t.string :photo, default: 'thespot.png'
      t.integer :favorites_count, default: 0
      t.timestamps
    end
  end
end
