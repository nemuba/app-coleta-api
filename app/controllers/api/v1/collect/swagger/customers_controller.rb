# frozen_string_literal: true

module Api
  module V1
    module Collect
      module Swagger
        class CustomersController
          include ::Swagger::Blocks

          swagger_path "/api/v1/collect/customers" do
            operation :get do
              key :summary, "Lista todos os clientes"
              key :description, "Retorna lista de clientes com perfil, endereço e pontos"
              key :operationId, "listCustomers"
              key :produces, ["application/json"]
              key :tags, ["Customers"]

              parameter do
                key :name, "Authorization"
                key :in, :header
                key :required, true
                key :type, :string
              end

              response 200 do
                key :description, "Lista de clientes"
                schema do
                  key :type, :array
                  items do
                    key :'$ref', :CustomerDTO
                  end
                end
              end

              response 401 do
                key :description, "Não autorizado"
              end
            end

            operation :post do
              key :summary, "Cria um novo cliente"
              key :operationId, "createCustomer"
              key :produces, ["application/json"]
              key :tags, ["Customers"]

              parameter do
                key :name, "Authorization"
                key :in, :header
                key :required, true
                key :type, :string
              end

              parameter do
                key :name, :customer
                key :in, :body
                key :required, true
                schema do
                  key :'$ref', :CustomerInput
                end
              end

              response 200 do
                key :description, "Cliente criado"
                schema do
                  key :'$ref', :CustomerDTO
                end
              end

              response 422 do
                key :description, "Erro de validação"
                schema do
                  key :'$ref', :ErrorModel
                end
              end
            end
          end

          swagger_path "/api/v1/collect/customers/{id}" do
            operation :get do
              key :summary, "Busca cliente por ID"
              key :operationId, "getCustomer"
              key :produces, ["application/json"]
              key :tags, ["Customers"]

              parameter do
                key :name, "Authorization"
                key :in, :header
                key :required, true
                key :type, :string
              end

              parameter do
                key :name, :id
                key :in, :path
                key :required, true
                key :type, :integer
              end

              response 200 do
                key :description, "Cliente encontrado"
                schema do
                  key :'$ref', :CustomerDTO
                end
              end

              response 404 do
                key :description, "Não encontrado"
              end
            end

            operation :put do
              key :summary, "Atualiza cliente"
              key :operationId, "updateCustomer"
              key :tags, ["Customers"]

              parameter do
                key :name, "Authorization"
                key :in, :header
                key :required, true
                key :type, :string
              end

              parameter do
                key :name, :id
                key :in, :path
                key :required, true
                key :type, :integer
              end

              parameter do
                key :name, :customer
                key :in, :body
                key :required, true
                schema do
                  key :'$ref', :CustomerInput
                end
              end

              response 200 do
                key :description, "Cliente atualizado"
                schema do
                  key :'$ref', :CustomerDTO
                end
              end
            end

            operation :delete do
              key :summary, "Remove cliente"
              key :operationId, "deleteCustomer"
              key :tags, ["Customers"]

              parameter do
                key :name, "Authorization"
                key :in, :header
                key :required, true
                key :type, :string
              end

              parameter do
                key :name, :id
                key :in, :path
                key :required, true
                key :type, :integer
              end

              response 204 do
                key :description, "Cliente removido"
              end
            end
          end
        end
      end
    end
  end
end
