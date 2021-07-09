# frozen_string_literal: true

class RouteCollectSerializer < ActiveModel::Serializer
  attributes :id, :collect_id, :route_id, :order, :created_at, :updated_at

  belongs_to :collect
end
