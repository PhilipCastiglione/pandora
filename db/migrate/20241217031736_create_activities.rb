class CreateActivities < ActiveRecord::Migration[8.0]
  def change
    create_table :activities do |t|
      t.date :drawn_on

      t.timestamps
    end
  end
end
