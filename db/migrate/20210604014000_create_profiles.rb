# frozen_string_literal: true

class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :document
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
