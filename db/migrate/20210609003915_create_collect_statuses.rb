class CreateCollectStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :collect_statuses do |t|
      t.string :name
      t.references :collect, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
