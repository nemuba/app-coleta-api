# frozen_string_literal: true

module Api
  module V1
    module Swagger
      class GetLocationController
        include ::Swagger::Blocks

        swagger_path "/api/v1/getlocation" do
          operation :post do
            key :summary, "Busca endereço por coordenadas"
            key :description, "Retorna endereço a partir de latitude e longitude (geocodificação reversa)"
            key :operationId, "getLocation"
            key :produces, ["application/json"]
            key :tags, ["Location"]

            parameter do
              key :name, "Authorization"
              key :in, :header
              key :required, true
              key :type, :string
              key :description, "Bearer {access_token}"
            end

            parameter do
              key :name, :coordinates
              key :in, :body
              key :required, true
              key :description, "Coordenadas geográficas"
              schema do
                key :'$ref', :LocationInput
              end
            end

            response 200 do
              key :description, "Endereço encontrado"
              schema do
                key :'$ref', :LocationDTO
              end
            end

            response 401 do
              key :description, "Não autorizado"
            end

            response 422 do
              key :description, "Parâmetros inválidos - latitude e longitude são obrigatórios"
              schema do
                key :'$ref', :ErrorModel
              end
            end
          end
        end
      end
    end
  end
end
