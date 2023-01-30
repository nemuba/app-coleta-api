# frozen_string_literal: true

class BussinessSerializer < BaseSerializer
  attributes :id, :email, :role, :token

  has_one :profile, foreign_key: :user_id
  has_many :products, foreign_key: :user_id
  has_many :system_module_users, foreign_key: :user_id
  has_many :user_modules, through: :system_module_users, source: :system_module
  has_many :product_user_histories,
           through: :products,
           foreign_key: :product_id
end
