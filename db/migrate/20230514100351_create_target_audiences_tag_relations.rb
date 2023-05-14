class CreateTargetAudiencesTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :target_audiences_tag_relations do |t|
      t.integer:post_shogi_place_id,null: false
      t.integer:target_audience_id,null: false
      t.timestamps
    end
  end
end
