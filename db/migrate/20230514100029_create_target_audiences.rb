class CreateTargetAudiences < ActiveRecord::Migration[6.1]
  def change
    create_table :target_audiences do |t|
      t.string:name,null: false
      t.timestamps
    end
  end
end
