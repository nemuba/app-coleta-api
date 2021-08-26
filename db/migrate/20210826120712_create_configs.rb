# frozen_string_literal: true

class CreateConfigs < ActiveRecord::Migration[6.1]
  def change
    create_table :configs do |t|
      t.string :param
      t.integer :value
      t.references :system_module, null: false, foreign_key: true

      t.timestamps
    end
  end
end
