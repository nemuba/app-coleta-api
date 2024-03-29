# frozen_string_literal: true

class UserSerializer < BaseSerializer
  attributes :id, :email, :role, :token

  has_one :profile
  has_many :routes
  has_many :products
  has_many :collects
  has_many :user_modules
  has_many :system_module_users
  has_one :user_point
  has_many :product_user_histories
end
