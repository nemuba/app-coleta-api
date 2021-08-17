# frozen_string_literal: true

class RouteSerializer < BaseSerializer
  attributes :id, :user_id, :collect_date, :request_date

  has_one :user
  has_many :route_collects

  def collect_date
    return unless object.collect_date

    object.collect_date.strftime("%Y-%m-%d")
  end

  def request_date
    return unless object.request_date

    object.request_date.strftime("%Y-%m-%d")
  end
end
