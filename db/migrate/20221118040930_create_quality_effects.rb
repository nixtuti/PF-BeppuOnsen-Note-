class CreateQualityEffects < ActiveRecord::Migration[6.1]
  def change
    create_table :quality_effects do |t|
      t.integer :quality_id, null: false
      t.integer :effect_id, null: false

      t.timestamps
    end
  end
end
