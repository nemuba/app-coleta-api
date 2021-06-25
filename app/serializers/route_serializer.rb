# frozen_string_literal: true

class RouteSerializer < ActiveModel::Serializer
  attributes :id, :date_collect, :date_start, :date_finish

  has_one :user
  has_many :route_collects
end