# frozen_string_literal: true

class RouteCollectSerializer < BaseSerializer
  attributes :id, :collect_id, :route_id, :order

  belongs_to :collect
end
