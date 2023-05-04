class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.string:name,null: false

      t.timestamps
    end
  end
end
