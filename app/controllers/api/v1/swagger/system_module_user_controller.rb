# frozen_string_literal: true

module Api
  module V1
    module Swagger
      class SystemModuleUserController
        include ::Swagger::Blocks

        swagger_path "/systemmoduleuser/{id}" do
          operation :get do
            key :summary, "Busca Relacionamento de Relacionamento de  e Usuário por IDMódulo e Usuário"
            key :description, "Retorna um relacionamento de módulo e usuário"
            key :operationId, "findSystemModuleUserById"
            key :tags, [
              "System Module User"
            ]
            parameter do
              key :name, :id
              key :in, :path
              key :description, "ID do relacionamento de módulo e usuário"
              key :required, true
              key :type, :integer
              key :format, :int64
            end
            response 200 do
              key :description, "Relacionamento de Módulo e Usuário"
              schema do
                key :'$ref', :SystemModuleUserDTO
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

        swagger_path "/systemmoduleuser" do
          operation :get do
            key :summary, "Retorna todos os relacionamentos de módulos e usuários"
            key :description, "Retorna todos os relacionamentos de módulos e usuários"
            key :operationId, "FindSystemModuleUser"
            key :produces, [
              "application/json",
              "text/html",
            ]
            key :tags, [
              "System Module User"
            ]

            response 200 do
              key :description, "Relacionamento de Módulo e Usuário"
              schema do
                key :type, :array
                items do
                  key :'$ref', :SystemModuleUserDTO
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

        swagger_path "/systemmoduleuser" do
          operation :post do
            key :summary, "Cadastra relacionamento de módulo e usuário"
            key :description, "Retorna o relacionamento de módulo e usuário"
            key :operationId, "AddSystemModuleUser"
            key :produces, [
              "application/json",
              "text/html",
            ]
            key :tags, [
              "System Module User"
            ]
            parameter do
              key :name, :system_module_user
              key :in, :body
              key :description, "Dados do Relacionamento de Módulo e Usuário"
              key :required, true
              schema do
                key :'$ref', :SystemModuleUserInput
              end
            end

            response 200 do
              key :description, "Relacionamento de Módulo e Usuário"
              schema do
                key :'$ref', :SystemModuleUserDTO
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

        swagger_path "/systemmoduleuser/{id}" do
          operation :put do
            key :summary, "Edita relacionamento de módulo com usuário"
            key :description, "Retorna o relacionamento atualizado"
            key :operationId, "UpdateSystemModuleUser"
            key :produces, [
              "application/json",
              "text/html",
            ]
            key :tags, [
              "System Module User"
            ]

            parameter do
              key :name, :id
              key :type, :integer
              key :in, :path
              key :description, "ID do relacionamento de módulo e usuário"
              key :required, true
            end

            parameter do
              key :name, :system_module_user
              key :in, :body
              key :description, "Dados do relacionamento de módulo e usuário"
              key :required, true
              schema do
                key :'$ref', :SystemModuleUserInput
              end
            end

            response 200 do
              key :description, "Relacionamento de Módulo e Usuário"
              schema do
                key :'$ref', :SystemModuleUserDTO
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

        swagger_path "/systemmoduleuser/{id}" do
          operation :delete do
            key :summary, "Exclui relacionamento de módulo e usuário"
            key :description, "Exclui o relacionamento de módulo e usuário"
            key :operationId, "DestroySystemModuleUser"
            key :produces, [
              "application/json",
              "text/html",
            ]
            key :tags, [
              "System Module User"
            ]

            parameter do
              key :name, :id
              key :type, :integer
              key :in, :path
              key :description, "ID do relacionamento de módulo e usuário"
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
