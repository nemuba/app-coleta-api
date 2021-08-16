# frozen_string_literal: true

class AddressSerializer < BaseSerializer
  attributes :id,
             :street,
             :number,
             :neighborhood,
             :city,
             :state,
             :country,
             :zip_code,
             :latitude,
             :longitude,
end
