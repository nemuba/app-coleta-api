# frozen_string_literal: true

class CreateSystemModules < ActiveRecord::Migration[6.1]
  def change
    create_table :system_modules do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
