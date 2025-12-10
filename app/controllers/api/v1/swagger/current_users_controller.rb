# frozen_string_literal: true

module Api
  module V1
    module Swagger
      class CurrentUsersController
        include ::Swagger::Blocks

        swagger_path "/api/v1/currentusers" do
          operation :get do
            key :summary, "Retorna usuário atual"
            key :description, "Retorna os dados completos do usuário autenticado com todas as associações"
            key :operationId, "getCurrentUser"
            key :produces, ["application/json"]
            key :tags, ["Current User"]

            parameter do
              key :name, "Authorization"
              key :in, :header
              key :required, true
              key :type, :string
              key :description, "Bearer {access_token}"
            end

            response 200 do
              key :description, "Dados do usuário atual"
              schema do
                key :'$ref', :UserDTO
              end
            end

            response 401 do
              key :description, "Não autorizado - Token inválido ou expirado"
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
