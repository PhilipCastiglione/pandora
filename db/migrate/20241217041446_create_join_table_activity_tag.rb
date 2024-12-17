class CreateJoinTableActivityTag < ActiveRecord::Migration[8.0]
  def change
    create_join_table :activities, :tags do |t|
      t.index [ :activity_id, :tag_id ]
      t.index [ :tag_id, :activity_id ]
    end
  end
end
