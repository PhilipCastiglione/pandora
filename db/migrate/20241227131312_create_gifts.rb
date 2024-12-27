class CreateGifts < ActiveRecord::Migration[8.0]
  def change
    create_table :gifts do |t|
      t.string :person
      t.string :event
      t.boolean :purchased, default: false

      t.timestamps
    end
  end
end
