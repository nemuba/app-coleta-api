# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_one :profile, dependent: :destroy
  has_many :system_module_users, dependent: :destroy
  has_many :user_modules, through: :system_module_users, source: :system_module
  has_many :products, dependent: :destroy
  has_many :collects, dependent: :destroy
  has_many :routes, dependent: :destroy
  has_many :point_histories, dependent: :destroy
  has_one :user_point, dependent: :destroy

  accepts_nested_attributes_for :user_point, allow_destroy: true
  accepts_nested_attributes_for :profile, allow_destroy: true
  accepts_nested_attributes_for :system_module_users, allow_destroy: true

  enum role: { admin: 0, customer: 1, business: 2, collector: 3 }

  validates :email, presence: true
  validates_uniqueness_of :email

  def self.admin?
    role == "admin"
  end

  def self.collector?
    role == "collector"
  end

  def self.business?
    role == "business"
  end

  def self.customer?
    role == "customer"
  end

  after_create do
    if role == "customer" || role == "admin"
      collect = SystemModule.find_or_create_by(name: "collect")

      system_module_users.create(system_module_id: collect.id)
    end
  end
end
