# frozen_string_literal: true

module Api
  module V1
    module Users
      module Swagger
        class PasswordsController
          include ::Swagger::Blocks

          # PATCH /api/v1/users/passwords
          swagger_path "/api/v1/users/passwords" do
            operation :patch do
              key :summary, "Alterar senha"
              key :description, "Altera a senha do usuário autenticado e retorna novos tokens"
              key :operationId, "ChangePassword"
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
                key :name, :password_params
                key :in, :body
                key :required, true
                key :description, "Nova senha"
                schema do
                  key :'$ref', :PasswordChangeDTO
                end
              end

              response 200 do
                key :description, "Senha alterada com sucesso"
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
                    key :example, "Password changed successfully"
                  end
                end
              end

              response 401 do
                key :description, "Não autorizado - Token inválido ou expirado"
                schema do
                  key :'$ref', :ErrorModel
                end
              end

              response 422 do
                key :description, "Erro de validação - Senhas não conferem"
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
