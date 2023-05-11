class CreatePostcomments < ActiveRecord::Migration[6.1]
  def change
    create_table :postcomments do |t|
      t.integer:post_shogi_place_id,null: false
      t.integer:customer_id,null: false
      t.string:comment,null: false

      t.timestamps
    end
  end
end
