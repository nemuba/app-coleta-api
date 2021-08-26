# frozen_string_literal: true

class RemoveColumnsToRoutes < ActiveRecord::Migration[6.1]
  def change
    remove_column :routes, :date_finish
    rename_column :routes, :date_start, :request_date
    rename_column :routes, :date_collect, :collect_date
  end
end
