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

              parameter do
                key :name, :password_confirmation
                key :in, :body
                key :description, "Password Confirmation"
                key :required, true
                schema do
                  key :type, :string
                end
              end

              parameter do
                key :name, :role
                key :in, :body
                key :description, "Role"
                key :required, false
                schema do
                  key :type, :string
                  key :format, "admin, collector, customer, business"
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
