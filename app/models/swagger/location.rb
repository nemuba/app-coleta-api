# frozen_string_literal: true

module Swagger
  class Location
    include ::Swagger::Blocks

    swagger_schema :LocationInput do
      key :required, [:latitude, :longitude]

      property :latitude do
        key :type, :number
        key :format, :double
        key :description, "Latitude"
      end

      property :longitude do
        key :type, :number
        key :format, :double
        key :description, "Longitude"
      end
    end

    swagger_schema :LocationDTO do
      property :address do
        key :type, :string
        key :description, "Endereço formatado"
      end

      property :city do
        key :type, :string
      end

      property :state do
        key :type, :string
      end

      property :country do
        key :type, :string
      end

      property :postal_code do
        key :type, :string
      end
    end
  end
end
