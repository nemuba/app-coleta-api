# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_one :profile, dependent: :destroy
  has_many :system_module_users
  has_many :user_modules, through: :system_module_users, source: :system_module

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
    if role == "customer"
      customer = SystemModule.find_by(name: "customer")

      system_module_users.create(system_module_id: customer.id)
    end
  end
end
