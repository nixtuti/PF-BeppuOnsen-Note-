class CreateHotSpringTags < ActiveRecord::Migration[6.1]
  def change
    create_table :hot_spring_tags do |t|
      t.integer :hot_spring_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
