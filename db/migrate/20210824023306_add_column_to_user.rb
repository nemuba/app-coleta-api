# frozen_string_literal: true

class AddColumnToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :token, :string, limit: 250
  end
end
