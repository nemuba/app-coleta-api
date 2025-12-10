# frozen_string_literal: true

module Api
  module V1
    module Users
      module Swagger
        class RegistrationController
          include ::Swagger::Blocks

          # POST /api/v1/users/sign_up
          swagger_path "/api/v1/users/sign_up" do
            operation :post do
              key :summary, "Cadastra usuário"
              key :description, "Registra um novo usuário e retorna tokens de autenticação nos headers"
              key :operationId, "UserSignUp"
              key :produces, ["application/json"]
              key :tags, ["Authentication"]

              parameter do
                key :name, :auth
                key :in, :body
                key :required, true
                key :description, "Dados de registro do usuário"
                schema do
                  key :'$ref', :RegistrationDTO
                end
              end

              response 200 do
                key :description, "Usuário cadastrado com sucesso"
                header "Access-Token" do
                  key :type, :string
                  key :description, "JWT Access Token"
                end
                header "Refresh-Token" do
                  key :type, :string
                  key :description, "Refresh Token para renovação"
                end
                header "Expire-At" do
                  key :type, :integer
                  key :description, "Timestamp de expiração do Access Token"
                end
                schema do
                  key :'$ref', :UserDTO
                end
              end

              response 422 do
                key :description, "Erro de validação"
                schema do
                  key :'$ref', :ErrorModel
                end
              end
            end
          end

          # DELETE /api/v1/users/delete
          swagger_path "/api/v1/users/delete" do
            operation :delete do
              key :summary, "Exclui conta do usuário"
              key :description, "Remove a conta do usuário autenticado"
              key :operationId, "UserDelete"
              key :produces, ["application/json"]
              key :tags, ["Authentication"]

              parameter do
                key :name, "Authorization"
                key :in, :header
                key :required, true
                key :type, :string
                key :description, "Bearer {access_token}"
              end

              response 200 do
                key :description, "Conta excluída com sucesso"
                schema do
                  property :message do
                    key :type, :string
                    key :example, "Account deleted successfully"
                  end
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
end
