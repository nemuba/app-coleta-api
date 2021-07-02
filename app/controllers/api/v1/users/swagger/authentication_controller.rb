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
                key :name, :email
                key :in, :body
                key :description, "Email"
                key :required, true
                schema do
                  key :type, :string
                end
              end

              parameter do
                key :name, :password
                key :in, :body
                key :description, "Password"
                key :required, true
                schema do
                  key :type, :string
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
