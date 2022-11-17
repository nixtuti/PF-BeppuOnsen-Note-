class CreateHotSpringQualities < ActiveRecord::Migration[6.1]
  def change
    create_table :hot_spring_qualities do |t|
      t.integer :hot_spring_id, null: false
      t.integer :quality_id, null: false

      t.timestamps
    end
  end
end
