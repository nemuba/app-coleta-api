# frozen_string_literal: true

class CreateItemCollects < ActiveRecord::Migration[6.1]
  def change
    create_table :item_collects do |t|
      t.references :item, null: false, foreign_key: true
      t.references :collect, null: false, foreign_key: true
      t.float :weight

      t.timestamps
    end
  end
end
