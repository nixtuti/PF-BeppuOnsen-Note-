class CreateVisitedMarks < ActiveRecord::Migration[6.1]
  def change
    create_table :visited_marks do |t|
      t.integer :hot_spring_id, null: false
      t.integer :user_id

      t.timestamps
    end
  end
end
