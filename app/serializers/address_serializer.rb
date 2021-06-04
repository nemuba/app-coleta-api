# frozen_string_literal: true

class AddressSerializer < ActiveModel::Serializer
  attributes :id, :street, :number, :neighborhood, :city, :zip_code, :latitude, :longitude
end
