# frozen_string_literal: true

class Customer < ApplicationRecord
  include Authentication

  self.table_name = "users"
  self.primary_key = "id"

  has_one :profile, foreign_key: :user_id, dependent: :destroy
  has_one :user_point, foreign_key: :user_id, dependent: :destroy
  has_many :collects, foreign_key: :user_id, dependent: :destroy
  has_many :product_user_histories, foreign_key: :user_id, dependent: :destroy
  has_many :system_module_users, foreign_key: :user_id, dependent: :destroy

  has_many :user_modules,
            through: :system_module_users,
            source: :system_module

  accepts_nested_attributes_for :profile, allow_destroy: true
  accepts_nested_attributes_for :user_point, allow_destroy: true
  accepts_nested_attributes_for :system_module_users, allow_destroy: true
  accepts_nested_attributes_for :product_user_histories, allow_destroy: true

  default_scope { where(role: User.roles[:customer]) }
end
