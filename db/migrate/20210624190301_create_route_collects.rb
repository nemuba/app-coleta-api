# frozen_string_literal: true

class CreateRouteCollects < ActiveRecord::Migration[6.1]
  def change
    create_table :route_collects do |t|
      t.references :route, null: false, foreign_key: true
      t.references :collect, null: false, foreign_key: true
      t.integer :order

      t.timestamps
    end
  end
end
