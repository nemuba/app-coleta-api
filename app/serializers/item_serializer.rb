# frozen_string_literal: true

class ItemSerializer < BaseSerializer
  attributes :id, :point, :point_weight, :name
  has_one :item_type

  has_many :item_collects
end
