# frozen_string_literal: true

module Api
  module V1
    module Collect
      module Swagger
        class UsersController
          include ::Swagger::Blocks

          swagger_path "/users/{id}" do
            operation :get do
              key :summary, "Busca Usuário por ID"
              key :description, "Retorna um usuário se o usuário tiver permissão de acesso"
              key :operationId, "findUserById"
              key :tags, [
                "User"
              ]
              parameter do
                key :name, :id
                key :in, :path
                key :description, "ID do usuário"
                key :required, true
                key :type, :integer
                key :format, :int64
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

          swagger_path "/users" do
            operation :get do
              key :summary, "Retorna todas os usuários cadastrados no sistema"
              key :description, "Retorna todas os usuários se o usuário tiver permissão de acesso"
              key :operationId, "FindUsers"
              key :produces, [
                "application/json",
                "text/html",
              ]
              key :tags, [
                "User"
              ]

              response 200 do
                key :description, "Usuário"
                schema do
                  key :type, :array
                  items do
                    key :'$ref', :UserDTO
                  end
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

          swagger_path "/users/{id}" do
            operation :put do
              key :summary, "Edita usuário no sistema"
              key :description, "Retorna o usuário atualizado"
              key :operationId, "UpdateUser"
              key :produces, [
                "application/json",
                "text/html",
              ]
              key :tags, [
                "User"
              ]

              parameter do
                key :name, :id
                key :type, :integer
                key :in, :path
                key :description, "ID do usuário"
                key :required, true
              end

              parameter do
                key :name, :user
                key :in, :body
                key :description, "Dados do usuário"
                key :required, true
                schema do
                  key :'$ref', :UserInput
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

          swagger_path "/users/{id}" do
            operation :delete do
              key :summary, "Exclui usuário no sistema"
              key :description, "Exclui o usuário"
              key :operationId, "DestroyUser"
              key :produces, [
                "application/json",
                "text/html",
              ]
              key :tags, [
                "User"
              ]

              parameter do
                key :name, :id
                key :type, :integer
                key :in, :path
                key :description, "ID do usuário"
                key :required, true
              end

              response 204 do
                key :description, "not_content"
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
