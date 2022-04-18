# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

["admin@admin.com"].each do |user|
  unless User.find_by_email(user)
    User.create(email: user, password: "123456789", password_confirmation: "123456789", role: 0)
  end
end

["collect"].each do |system_module|
  admin = User.find_by_email("admin@admin.com")
  s_module = SystemModule.find_or_create_by(name: system_module, user_id: admin.id)

  SystemModuleUser.find_or_create_by(user_id: admin.id, system_module_id: s_module.id)

  Config.find_or_create_by(system_module_id: s_module.id, param: "user_point", value: 100)
end
