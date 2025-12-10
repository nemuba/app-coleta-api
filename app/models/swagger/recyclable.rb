# frozen_string_literal: true

module Swagger
  class Recyclable
    include ::Swagger::Blocks

    swagger_schema :RecyclableDTO do
      property :id do
        key :type, :integer
      end

      property :name do
        key :type, :string
        key :description, "Nome do material reciclável"
      end

      property :unit_of_measurement do
        key :type, :string
        key :enum, [:gram, :kilogram, :unity]
        key :description, "Unidade de medida"
      end

      property :measure do
        key :type, :number
        key :format, :float
        key :description, "Medida"
      end

      property :point do
        key :type, :integer
        key :description, "Pontos por unidade"
      end

      property :created_at do
        key :type, :string
        key :format, "date-time"
      end

      property :updated_at do
        key :type, :string
        key :format, "date-time"
      end
    end

    swagger_schema :RecyclableInput do
      key :required, [:name, :unit_of_measurement, :measure, :point]

      property :name do
        key :type, :string
      end

      property :unit_of_measurement do
        key :type, :string
        key :enum, [:gram, :kilogram, :unity]
      end

      property :measure do
        key :type, :number
        key :format, :float
      end

      property :point do
        key :type, :integer
      end
    end
  end
end
