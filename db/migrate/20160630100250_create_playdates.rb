class CreatePlaydates < ActiveRecord::Migration
  def change
    create_table :playdates do |t|
    t.integer :host_id, null: false
    t.time :time, null: false
    t.date :date, null: false
    t.integer :duration, null: false
    t.string :location, null: false
    t.string :description, null: false
    t.string :title, null: false
    t.timestamps(null: false)
    end
  end
end
