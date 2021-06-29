class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :point
      t.float :point_weight
      t.string :name
      t.references :item_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
