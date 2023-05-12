class CreateTaggings < ActiveRecord::Migration[6.1]
  def change
    create_table :taggings do |t|
      t.integer:post_shogi_place_id,null: false
      t.integer:tag_id,null: false
      t.timestamps
    end

  # 同じタグを2個保存できないようにする
  add_index :taggings,[:post_shogi_place_id,:tag_id],unique:true
  end
end
