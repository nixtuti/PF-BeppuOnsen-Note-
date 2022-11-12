class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :title, null: false
      t.float :rate, null: false, default: 2.5
      t.text :body, null: false
      t.integer :hot_spring_id, null: false
      t.integer :user_id, null: false
      t.boolean :is_pablished, default: true

      t.timestamps
    end
  end
end
