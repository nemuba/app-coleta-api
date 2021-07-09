# frozen_string_literal: true

class ItemTypeSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at, :updated_at
end
