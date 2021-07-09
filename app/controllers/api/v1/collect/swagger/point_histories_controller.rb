# frozen_string_literal: true

module Api
  module V1
    module Collect
      module Swagger
        class PointHistoriesController
          include ::Swagger::Blocks

          swagger_path "/pointhistories/{id}" do
            operation :get do
              key :summary, "Busca Item por ID"
              key :description, "Retorna um item se o usuário tiver permissão de acesso"
              key :operationId, "findPointHistoryById"
              key :tags, [
                "Point History"
              ]
              parameter do
                key :name, :id
                key :in, :path
                key :description, "ID do ponto"
                key :required, true
                key :type, :integer
                key :format, :int64
              end
              response 200 do
                key :description, "Point History"
                schema do
                  key :'$ref', :PointHistoryDTO
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

          swagger_path "/pointhistories" do
            operation :get do
              key :summary, "Retorna todas as pontos cadastrados no sistema"
              key :description, "Retorna todas as pontos se o usuário tiver permissão de acesso"
              key :operationId, "FindPointHistories"
              key :produces, [
                "application/json",
                "text/html",
              ]
              key :tags, [
                "Point History"
              ]

              response 200 do
                key :description, "Point History"
                schema do
                  key :type, :array
                  items do
                    key :'$ref', :PointHistoryDTO
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

          swagger_path "/pointhistories" do
            operation :post do
              key :summary, "Cadastra ponto no sistema"
              key :description, "Retorna o ponto cadastrado"
              key :operationId, "AddPointHistory"
              key :produces, [
                "application/json",
                "text/html",
              ]
              key :tags, [
                "Point History"
              ]
              parameter do
                key :name, :point_history
                key :in, :body
                key :description, "Dados do Ponto"
                key :required, true
                schema do
                  key :'$ref', :PointHistoryInputDTO
                end
              end

              response 200 do
                key :description, "Point History"
                schema do
                  key :'$ref', :PointHistoryDTO
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

          swagger_path "/pointhistories/{id}" do
            operation :put do
              key :summary, "Edita ponto no sistema"
              key :description, "Retorna o ponto atualizada"
              key :operationId, "UpdatePointHistory"
              key :produces, [
                "application/json",
                "text/html",
              ]
              key :tags, [
                "Point History"
              ]

              parameter do
                key :name, :id
                key :type, :integer
                key :in, :path
                key :description, "ID do ponto"
                key :required, true
              end

              parameter do
                key :name, :point_history
                key :in, :body
                key :description, "Dados do ponto"
                key :required, true
                schema do
                  key :'$ref', :PointHistoryInputDTO
                end
              end

              response 200 do
                key :description, "Point History"
                schema do
                  key :'$ref', :PointHistoryDTO
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

          swagger_path "/pointhistories/{id}" do
            operation :delete do
              key :summary, "Exclui ponto no sistema"
              key :description, "Exclui um ponto"
              key :operationId, "DestroyPointHistory"
              key :produces, [
                "application/json",
                "text/html",
              ]
              key :tags, [
                "Point History"
              ]

              parameter do
                key :name, :id
                key :type, :integer
                key :in, :path
                key :description, "ID do ponto"
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
