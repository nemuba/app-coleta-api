# frozen_string_literal: true

class CreateProductUserHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :product_user_histories do |t|
      t.references :product, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :quantity, default: 1
      t.integer :total_points
      t.integer :user_points

      t.timestamps
    end

    add_index :product_user_histories, %i[product_id user_id]
  end
end
