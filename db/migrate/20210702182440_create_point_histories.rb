# frozen_string_literal: true

class CreatePointHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :point_histories do |t|
      t.references :user, null: false, foreign_key: true
      t.references :collector, null: false, foreign_key: { to_table: :users }
      t.references :collect, null: false, foreign_key: true
      t.integer :value

      t.timestamps
    end
  end
end
