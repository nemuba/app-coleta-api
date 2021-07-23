# frozen_string_literal: true

class AddressSerializer < ActiveModel::Serializer
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
             :created_at,
             :updated_at
end
