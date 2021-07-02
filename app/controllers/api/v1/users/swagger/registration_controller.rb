# frozen_string_literal: true

module Api
  module V1
    module Users
      module Swagger
        class RegistrationController
          include ::Swagger::Blocks

          swagger_path "/api/v1/users/sign_up" do
            operation :post do
              key :summary, "Cadastra usuário"
              key :description, "Retorna o usuário cadastrado"
              key :operationId, "UserSignUp"
              key :produces, [
                "application/json",
                "text/html",
              ]
              key :tags, [
                "User - Sign up"
              ]

              parameter do
                key :name, :auth
                key :in, :body
                key :required, true
                schema do
                  key :'$ref', :RegistrationDTO
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
