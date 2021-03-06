# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :profile

  validates :street,
            :neighborhood,
            :number,
            :city,
            :state,
            :country,
            :zip_code,
            :latitude,
            :longitude,
            presence: true

  geocoded_by :address
  after_initialize :geocode
  before_validation :geocode, on: [:update]

  def address
    [number, street, neighborhood, city, state].compact.join(", ")
  end
end
