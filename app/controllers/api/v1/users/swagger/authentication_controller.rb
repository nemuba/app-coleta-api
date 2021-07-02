# frozen_string_literal: true

module Api
  module V1
    module Users
      module Swagger
        class AuthenticationController
          include ::Swagger::Blocks

          swagger_path "/api/v1/users/sign_in" do
            operation :post do
              key :summary, "Login usuário"
              key :description, "Retorna o usuário logado"
              key :operationId, "UserSignIn"
              key :produces, [
                "application/json",
                "text/html",
              ]
              key :tags, [
                "User - Sign in"
              ]

              parameter do
                key :name, :auth
                key :in, :body
                key :required, true
                schema do
                  key :'$ref', :AuthenticationDTO
                end
              end

              response 200 do
                key :description, "Usuário"
                schema do
                  key :'$ref', :UserDTO
                end
              end

              response :default do
                key :description, "Error"
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
