class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :title
      t.float :rate, null: false, default: 2.5
      t.text :body
      t.integer :hot_spring_id
      t.integer :user_id
      t.boolean :is_pablished

      t.timestamps
    end
  end
end
