# frozen_string_literal: true

class CreateCollects < ActiveRecord::Migration[6.1]
  def change
    create_table :collects do |t|
      t.references :user, null: false, foreign_key: true
      t.string :note

      t.timestamps
    end
  end
end
