# frozen_string_literal: true

class CreateRoutes < ActiveRecord::Migration[6.1]
  def change
    create_table :routes do |t|
      t.date :date_collect
      t.datetime :date_start
      t.datetime :date_finish
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
