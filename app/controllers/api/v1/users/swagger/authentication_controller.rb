# frozen_string_literal: true

module Api
  module V1
    module Users
      module Swagger
        class AuthenticationController
          include ::Swagger::Blocks

          # POST /api/v1/users/sign_in
          swagger_path "/api/v1/users/sign_in" do
            operation :post do
              key :summary, "Login de usuário"
              key :description, "Autentica o usuário e retorna tokens JWT nos headers"
              key :operationId, "UserSignIn"
              key :produces, ["application/json"]
              key :tags, ["Authentication"]

              parameter do
                key :name, :auth
                key :in, :body
                key :required, true
                key :description, "Credenciais de login"
                schema do
                  key :'$ref', :AuthenticationDTO
                end
              end

              response 200 do
                key :description, "Login realizado com sucesso"
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
                key :description, "Credenciais inválidas"
                schema do
                  key :'$ref', :ErrorModel
                end
              end
            end
          end

          # DELETE /api/v1/users/sign_out
          swagger_path "/api/v1/users/sign_out" do
            operation :delete do
              key :summary, "Logout de usuário"
              key :description, "Invalida o token JWT do usuário autenticado"
              key :operationId, "UserSignOut"
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
                key :description, "Logout realizado com sucesso"
                schema do
                  property :message do
                    key :type, :string
                    key :example, "Signed out successfully"
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
