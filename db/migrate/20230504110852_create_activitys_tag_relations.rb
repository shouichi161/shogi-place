class CreateActivitysTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :activitys_tag_relations do |t|
      t.integer:shogi_place_id,null: false
      t.integer:activity_id,null: false

      t.timestamps
    end
  end
end
