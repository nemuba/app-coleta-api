# frozen_string_literal: true

class RouteSerializer < BaseSerializer
  attributes :id, :user_id, :date_collect, :date_start, :date_finish

  has_one :user
  has_many :route_collects

  def date_start
    return unless object.date_start

    object.date_start.strftime('%d/%m/%Y')
  end

  def date_finish
    return unless object.date_finish

    object.date_finish.strftime('%d/%m/%Y')
  end

  def date_collect
    return unless object.date_collect

    object.date_collect.strftime('%d/%m/%Y')
  end
end
