# frozen_string_literal: true

class Recyclable < ApplicationRecord
  enum unit_of_measurement: {
    gram: 0,
    kilogram: 1,
    unity: 2,
  }
  validates :name, presence: true
  validates :unit_of_measurement, presence: true
  validates :measure, presence: true
  validates :point, presence: true
  validates :point, numericality: { greater_than_or_equal_to: 0 }
  validates :measure, numericality: { greater_than_or_equal_to: 0 }
end
