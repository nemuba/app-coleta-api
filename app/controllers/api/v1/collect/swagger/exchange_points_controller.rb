# frozen_string_literal: true

module Api
  module V1
    module Collect
      module Swagger
        class ExchangePointsController
          include ::Swagger::Blocks

          swagger_path "/api/v1/collect/exchange_points" do
            operation :post do
              key :summary, "Troca pontos por produto"
              key :description, "Realiza a troca de pontos do cliente por um produto"
              key :operationId, "exchangePoints"
              key :produces, ["application/json"]
              key :tags, ["Exchange Points"]

              parameter do
                key :name, "Authorization"
                key :in, :header
                key :required, true
                key :type, :string
                key :description, "Bearer {access_token}"
              end

              parameter do
                key :name, :exchange_point
                key :in, :body
                key :required, true
                key :description, "Dados da troca"
                schema do
                  key :'$ref', :ExchangePointInput
                end
              end

              response 201 do
                key :description, "Troca realizada com sucesso"
                schema do
                  key :'$ref', :ExchangePointDTO
                end
              end

              response 401 do
                key :description, "Não autorizado"
              end

              response 422 do
                key :description, "Erro na troca - pontos insuficientes ou dados inválidos"
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
