# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :role, :created_at, :updated_at
  has_one :profile

  has_many :routes
  has_many :products
  has_many :collects
  has_many :user_modules
end
