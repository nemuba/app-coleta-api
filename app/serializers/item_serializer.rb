class ItemSerializer < ActiveModel::Serializer
  attributes :id, :point, :point_weight, :name, :created_at, :updated_at
  has_one :item_type
end
