# frozen_string_literal: true

class AddColumnToAddress < ActiveRecord::Migration[6.1]
  def change
    add_column :addresses, :state, :string
  end
end
