# frozen_string_literal: true

class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :point, :created_at, :updated_at
  has_one :user
end
