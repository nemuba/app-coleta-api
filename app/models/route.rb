# frozen_string_literal: true

class Route < ApplicationRecord
  belongs_to :user

  has_many :route_collects
  accepts_nested_attributes_for :route_collects, allow_destroy: true

  after_save :update_collect_status
  before_destroy :remove_collect_status

  def update_collect_status
    route_collects.each do |rc|
      rc.collect.update(collect_status_attributes: { id: rc.collect.collect_status.id, name: "Aguardando Coleta" })
    end
  end

  def remove_collect_status
    route_collects.each do |rc|
      rc.collect.update(collect_status_attributes: { id: rc.collect.collect_status.id, name: "Aguardando Confirmação" })
    end
  end
end
