# frozen_string_literal: true

class ItemCollectSerializer < ActiveModel::Serializer
  attribute :id, item_id, :collect_id, :created_at, :updated_at

  has_one :collect
end
