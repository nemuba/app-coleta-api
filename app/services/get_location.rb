# frozen_string_literal: true

class GetLocation
  attr_accessor :longitude, :latitude, :address

  def initialize(longitude, latitude)
    @longitude = longitude.to_f
    @latitude = latitude.to_f
  end

  def self.call(longitude, latitude)
    self.new(longitude, latitude).call
  end

  def call
    data = Geocoder.search([longitude, latitude])
    return location_not_found unless data.present?
    
    @address = data.first
    
    return location_not_found unless address.present? && address.data["address_components"].present?
    
    location
  end

  def location
    {
      location: {
        number: address.data["address_components"][0]["long_name"],
        street: address.data["address_components"][1]["long_name"],
        neighborhood: address.data["address_components"][2]["long_name"],
        city: address.data["address_components"][3]["long_name"],
        state: address.data["address_components"][4]["long_name"],
        country: address.data["address_components"][5]["long_name"],
        zipcode: address.data["address_components"][6]["long_name"]
      }
    }
  end

  def location_not_found
    { status: "error", msg: "Location not found " }
  end
end
