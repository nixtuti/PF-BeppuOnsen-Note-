class CreateHotSprings < ActiveRecord::Migration[6.1]
  def change
    create_table :hot_springs do |t|
      t.string :name,               null: false
      t.text :introduction,         null:false
      t.string :address,            null:false
      t.string :price,              null:false
      t.string :private_bath_price, null:false
      t.string :hours,              null:false
      t.string :holiday,            null:false
      t.float :latitude
      t.float :longtude
      t.string :parking,            null:false
      t.string :contact,            null:false
      t.integer :running_status,    null:false, default: 0
      t.boolean :is_pablished,       null:false, default: false
      
      t.timestamps
    end
  end
end
