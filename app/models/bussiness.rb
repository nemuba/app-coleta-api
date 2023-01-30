# frozen_string_literal: true

# Bussines: This class is used to manage the bussines logic
class Bussiness < ApplicationRecord
  self.table_name = "users"
  self.primary_key = "id"

  include Authentication

  enum role: { admin: 0, customer: 1, business: 2, collector: 3 }

  has_one :profile, foreign_key: :user_id
  has_many :system_module_users, foreign_key: :user_id, dependent: :destroy
  has_many :user_modules, through: :system_module_users, source: :system_module
  has_many :products,
           foreign_key: :user_id,
           dependent: :destroy

  has_many :product_user_histories,
           through: :products,
           foreign_key: :product_id
           
  default_scope { where(role: User.roles[:business]) }
end
