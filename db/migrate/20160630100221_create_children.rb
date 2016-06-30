class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.integer :parent_id, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.date :birthday, null: false
      t.string :allergies, null: false
      t.timestamps(null: false)
    end
  end
end
