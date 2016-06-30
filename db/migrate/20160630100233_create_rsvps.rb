class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.integer :child_id, null: false
      t.integer :playdate_id, null: false
      t.timestamps(null: false)
    end
  end
end
