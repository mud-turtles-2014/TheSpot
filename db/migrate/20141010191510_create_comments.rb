class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :user, null: false
      t.belongs_to :spot, null: false
      t.text :body, null: false
      t.integer :votes_count, default: 0
      t.timestamps
    end
  end
end
