class AddColumnInRoute < ActiveRecord::Migration[6.1]
  def up
    add_column :routes, :status, :integer, default: 0
  end

  def down
    remove_column :routes, :status
  end
end
