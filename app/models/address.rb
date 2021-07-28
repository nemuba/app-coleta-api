# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :profile

  validates :street, :neighborhood, :number, :city, :state, :country, :zip_code, presence: true

  geocoded_by :address
  after_validation :geocode

  def address
    [street, neighborhood, number, city, state, country].compact.join(", ")
  end
end
