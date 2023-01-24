# frozen_string_literal: true

class Route < ApplicationRecord
  enum status: { pending: 0, finished: 1 }
  belongs_to :user

  has_many :route_collects, dependent: :destroy
  accepts_nested_attributes_for :route_collects, allow_destroy: true

  after_save :update_collect_status

  def update_collect_status
    return unless status == "finished"

    route_collects.each do |rc|
      rc.collect.update(collect_status_attributes: { id: rc.collect.collect_status.id, name: "Coletado" })
    end
  end
end
