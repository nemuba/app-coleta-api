class CreateSystemModuleUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :system_module_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :system_module, null: false, foreign_key: true

      t.timestamps
    end
  end
end
