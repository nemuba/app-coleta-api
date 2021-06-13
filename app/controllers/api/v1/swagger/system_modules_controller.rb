# frozen_string_literal: true

module Api
  module V1
    module Swagger
      class SystemModulesController
        include ::Swagger::Blocks

        swagger_path "/systemmodules/{id}" do
          operation :get do
            key :summary, "Busca Módulo por ID"
            key :description, "Retorna um módulo se o usuário tiver permissão de acesso"
            key :operationId, "findSystemModuleById"
            key :tags, [
              "System Module"
            ]
            parameter do
              key :name, :id
              key :in, :path
              key :description, "ID do módulo"
              key :required, true
              key :type, :integer
              key :format, :int64
            end
            response 200 do
              key :description, "Módulo"
              schema do
                key :'$ref', :SystemModuleDTO
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

        swagger_path "/systemmodules" do
          operation :get do
            key :summary, "Retorna todos os módulos cadastrados no sistema"
            key :description, "Retorna todos os módulos se o usuário tiver permissão de acesso"
            key :operationId, "FindSystemModules"
            key :produces, [
              "application/json",
              "text/html",
            ]
            key :tags, [
              "System Module"
            ]

            response 200 do
              key :description, "Módulo"
              schema do
                key :type, :array
                items do
                  key :'$ref', :SystemModuleDTO
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

        swagger_path "/systemmodules" do
          operation :post do
            key :summary, "Cadastra módulo no sistema"
            key :description, "Retorna o módulo cadastrado"
            key :operationId, "AddSystemModule"
            key :produces, [
              "application/json",
              "text/html",
            ]
            key :tags, [
              "System Module"
            ]
            parameter do
              key :name, :system_module
              key :in, :body
              key :description, "Dados do Módulo"
              key :required, true
              schema do
                key :'$ref', :SystemModuleInput
              end
            end

            response 200 do
              key :description, "Módulo"
              schema do
                key :'$ref', :SystemModuleDTO
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

        swagger_path "/systemmodules/{id}" do
          operation :put do
            key :summary, "Edita módulo no sistema"
            key :description, "Retorna o módulo atualizado"
            key :operationId, "UpdateSystemModule"
            key :produces, [
              "application/json",
              "text/html",
            ]
            key :tags, [
              "System Module"
            ]

            parameter do
              key :name, :id
              key :type, :integer
              key :in, :path
              key :description, "ID do módulo"
              key :required, true
            end

            parameter do
              key :name, :system_module
              key :in, :body
              key :description, "Dados do módulo"
              key :required, true
              schema do
                key :'$ref', :SystemModuleInput
              end
            end

            response 200 do
              key :description, "Módulo"
              schema do
                key :'$ref', :SystemModuleDTO
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

        swagger_path "/systemmodules/{id}" do
          operation :delete do
            key :summary, "Exclui módulo no sistema"
            key :description, "Exclui o módulo"
            key :operationId, "DestroySystemModule"
            key :produces, [
              "application/json",
              "text/html",
            ]
            key :tags, [
              "System Module"
            ]

            parameter do
              key :name, :id
              key :type, :integer
              key :in, :path
              key :description, "ID do módulo"
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
