# frozen_string_literal: true

module Api
  module V1
    module Collect
      module Swagger
        class RoutesController
          include ::Swagger::Blocks

          swagger_path "/routes/{id}" do
            operation :get do
              key :summary, "Busca Rota por ID"
              key :description, "Retorna uma rota se o usuário tiver permissão de acesso"
              key :operationId, "findRouteById"
              key :tags, [
                "Route"
              ]
              parameter do
                key :name, :id
                key :in, :path
                key :description, "ID da rota"
                key :required, true
                key :type, :integer
                key :format, :int64
              end
              response 200 do
                key :description, "Rota"
                schema do
                  key :'$ref', :RouteDTO
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

          swagger_path "/routes" do
            operation :get do
              key :summary, "Retorna todas as rotas cadastradas no sistema"
              key :description, "Retorna todas as rotas se o usuário tiver permissão de acesso"
              key :operationId, "FindRoutes"
              key :produces, [
                "application/json",
                "text/html",
              ]
              key :tags, [
                "Route"
              ]

              response 200 do
                key :description, "Rota"
                schema do
                  key :type, :array
                  items do
                    key :'$ref', :RouteDTO
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

          swagger_path "/routes" do
            operation :post do
              key :summary, "Cadastra rota no sistema"
              key :description, "Retorna a rota cadastrada"
              key :operationId, "AddRoute"
              key :produces, [
                "application/json",
                "text/html",
              ]
              key :tags, [
                "Route"
              ]
              parameter do
                key :name, :route
                key :in, :body
                key :description, "Dados de Rota"
                key :required, true
                schema do
                  key :'$ref', :RouteInput
                end
              end

              response 200 do
                key :description, "Rota"
                schema do
                  key :'$ref', :RouteDTO
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

          swagger_path "/routes/{id}" do
            operation :put do
              key :summary, "Edita rota no sistema"
              key :description, "Retorna a rota atualizada"
              key :operationId, "UpdateRoute"
              key :produces, [
                "application/json",
                "text/html",
              ]
              key :tags, [
                "Route"
              ]

              parameter do
                key :name, :id
                key :type, :integer
                key :in, :path
                key :description, "ID da rota"
                key :required, true
              end

              parameter do
                key :name, :route
                key :in, :body
                key :description, "Dados de Rota"
                key :required, true
                schema do
                  key :'$ref', :RouteInput
                end
              end

              response 200 do
                key :description, "Rota"
                schema do
                  key :'$ref', :RouteDTO
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

          swagger_path "/routes/{id}" do
            operation :delete do
              key :summary, "Exclui rota no sistema"
              key :description, "Exclui a rota atualizada"
              key :operationId, "DestroyRoute"
              key :produces, [
                "application/json",
                "text/html",
              ]
              key :tags, [
                "Route"
              ]

              parameter do
                key :name, :id
                key :type, :integer
                key :in, :path
                key :description, "ID da rota"
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
