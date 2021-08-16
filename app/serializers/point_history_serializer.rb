# frozen_string_literal: true

class PointHistorySerializer < BaseSerializer
  attributes :id, :value
  has_one :user
  has_one :collector, class_name: "User"
  has_one :collect
end
