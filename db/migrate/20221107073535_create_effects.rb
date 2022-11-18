class CreateEffects < ActiveRecord::Migration[6.1]
  def change
    create_table :effects do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
