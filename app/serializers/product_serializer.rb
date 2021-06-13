# frozen_string_literal: true

class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :point
  has_one :user
end
