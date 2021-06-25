# frozen_string_literal: true

class Route < ApplicationRecord
  belongs_to :user

  has_many :route_collects
  accepts_nested_attributes_for :route_collects, allow_destroy: true
end
