# frozen_string_literal: true

class ProductSerializer < BaseSerializer
  attributes :id, :name, :price, :point
  has_one :user
end
