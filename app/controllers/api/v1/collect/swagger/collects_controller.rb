module Api
  module V1
    module Collect
      module Swagger
        class CollectsController
          include ::Swagger::Blocks

          swagger_path '/collects/{id}' do
            operation :get do
              key :summary, 'Busca Coleta por ID'
              key :description, 'Retorna um coleta se o usuário tiver permissão de acesso'
              key :operationId, 'findCollectById'
              key :tags, [
                'Collect'
              ]
              parameter do
                key :name, :id
                key :in, :path
                key :description, 'ID da coleta'
                key :required, true
                key :type, :integer
                key :format, :int64
              end
              response 200 do
                key :description, 'Coleta'
                schema do
                  key :'$ref', :CollectDTO
                end
              end
              response :default do
                key :description, 'Error'
                schema do
                  key :'$ref', :ErrorModel
                end
              end
            end
          end

          swagger_path '/collects' do
            operation :get do
              key :summary, 'Retorna todas as coletas cadastradas no sistema'
              key :description, 'Retorna todas as coletas se o usuário tiver permissão de acesso'
              key :operationId, 'FindCollects'
              key :produces, [
                'application/json',
                'text/html',
              ]
              key :tags, [
                'Collect'
              ]
              
              response 200 do
                key :description, 'Coleta'
                schema do
                  key :type, :array
                  items do
                    key :'$ref', :CollectDTO
                  end
                end
              end

              response :default do
                key :description, 'Error'
                schema do
                  key :'$ref', :ErrorModel
                end
              end
            end            
          end

          swagger_path '/collects' do
            operation :post do
              key :summary, 'Cadastra coleta no sistema'
              key :description, 'Retorna a coleta cadastrada'
              key :operationId, 'AddCollect'
              key :produces, [
                'application/json',
                'text/html',
              ]
              key :tags, [
                'Collect'
              ]
              parameter do
                key :name, :collect
                key :in, :body
                key :description, 'Dados de Coleta'
                key :required, true
                schema do
                  key :'$ref', :CollectInput
                end
              end

              response 200 do
                key :description, 'Coleta'
                schema do
                  key :'$ref', :CollectDTO
                end
              end
              response :default do
                key :description, 'Error'
                schema do
                  key :'$ref', :ErrorModel
                end
              end
            end
          end

          swagger_path '/collects/{id}' do
            operation :put do
              key :summary, 'Edita coleta no sistema'
              key :description, 'Retorna a coleta atualizada'
              key :operationId, 'UpdateCollect'
              key :produces, [
                'application/json',
                'text/html',
              ]
              key :tags, [
                'Collect'
              ]

              parameter do
                key :name, :id
                key :type, :integer
                key :in, :path
                key :description, 'ID da coleta'
                key :required, true
              end

              parameter do
                key :name, :collect
                key :in, :body
                key :description, 'Dados de Coleta'
                key :required, true
                schema do
                  key :'$ref', :CollectInput
                end
              end

              response 200 do
                key :description, 'Coleta'
                schema do
                  key :'$ref', :CollectDTO
                end
              end
              response :default do
                key :description, 'Error'
                schema do
                  key :'$ref', :ErrorModel
                end
              end
            end
          end

          swagger_path '/collects/{id}' do
            operation :delete do
              key :summary, 'Exclui coleta no sistema'
              key :description, 'Exclui a coleta atualizada'
              key :operationId, 'DestroyCollect'
              key :produces, [
                'application/json',
                'text/html',
              ]
              key :tags, [
                'Collect'
              ]

              parameter do
                key :name, :id
                key :type, :integer
                key :in, :path
                key :description, 'ID da coleta'
                key :required, true
              end

              response 204 do
                key :description, 'not_content'
              end
              response :default do
                key :description, 'Error'
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
