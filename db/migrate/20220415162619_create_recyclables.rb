# frozen_string_literal: true

class CreateRecyclables < ActiveRecord::Migration[6.1]
  def change
    create_table :recyclables do |t|
      t.string :name, null: false
      t.integer :unit_of_measurement, null: false, default: 0
      t.float :measure, null: false
      t.integer :point, null: false

      t.timestamps
    end
  end
end
