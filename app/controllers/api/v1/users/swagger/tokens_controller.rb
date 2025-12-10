# frozen_string_literal: true

module Api
  module V1
    module Users
      module Swagger
        class TokensController
          include ::Swagger::Blocks

          # POST /api/v1/users/tokens
          swagger_path "/api/v1/users/tokens" do
            operation :post do
              key :summary, "Renovar Access Token"
              key :description, "Renova o Access Token usando o Refresh Token válido"
              key :operationId, "RefreshToken"
              key :produces, ["application/json"]
              key :tags, ["Authentication"]

              parameter do
                key :name, "Authorization"
                key :in, :header
                key :required, true
                key :type, :string
                key :description, "Bearer {access_token}"
              end

              parameter do
                key :name, "Refresh-Token"
                key :in, :header
                key :required, true
                key :type, :string
                key :description, "Refresh Token recebido no login"
              end

              response 200 do
                key :description, "Token renovado com sucesso"
                header "Access-Token" do
                  key :type, :string
                  key :description, "Novo JWT Access Token"
                end
                header "Refresh-Token" do
                  key :type, :string
                  key :description, "Novo Refresh Token"
                end
                header "Expire-At" do
                  key :type, :integer
                  key :description, "Timestamp de expiração do novo Access Token"
                end
                schema do
                  property :message do
                    key :type, :string
                    key :example, "Token refreshed successfully"
                  end
                end
              end

              response 401 do
                key :description, "Não autorizado - Token ou Refresh Token inválido"
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
end
