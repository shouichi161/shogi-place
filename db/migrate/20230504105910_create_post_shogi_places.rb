class CreatePostShogiPlaces < ActiveRecord::Migration[6.1]
  def change
    create_table :post_shogi_places do |t|
      t.integer:customer_id,null: false
      t.integer:prefecture_id,null: false
      t.string:name,null: false
      t.string:address,null: false
      t.float:latitude,null: false
      t.float:longitude,null: false
      t.string:telephone_number,null: false
      t.text:explanation,null: false
      t.integer:target,null: false
      t.string:activity,null: false

      t.timestamps
    end
  end
end
