# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin = User.create(email: "admin@admin.com", password: "123456789", password_confirmation: "123456789", role: 0)

["collect"].each do |system_module|
  s_module = SystemModule.create(name: system_module, user_id: admin.id)

  SystemModuleUser.create(user_id: admin.id, system_module_id: s_module.id)
end
