# frozen_string_literal: true

module Api
  module V1
    module Collect
      module Swagger
        class ProfilesController
          include ::Swagger::Blocks

          swagger_path "/profiles/{id}" do
            operation :get do
              key :summary, "Busca Perfil por ID"
              key :description, "Retorna um perfil se o usuário tiver permissão de acesso"
              key :operationId, "findProfileById"
              key :tags, [
                "Profile"
              ]
              parameter do
                key :name, :id
                key :in, :path
                key :description, "ID do perfil"
                key :required, true
                key :type, :integer
                key :format, :int64
              end
              response 200 do
                key :description, "Perfil"
                schema do
                  key :'$ref', :ProfileDTO
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

          swagger_path "/profiles" do
            operation :get do
              key :summary, "Retorna todas os perfis cadastrados no sistema"
              key :description, "Retorna todas os perfis se o usuário tiver permissão de acesso"
              key :operationId, "FindProfiles"
              key :produces, [
                "application/json",
                "text/html",
              ]
              key :tags, [
                "Profile"
              ]

              response 200 do
                key :description, "Perfil"
                schema do
                  key :type, :array
                  items do
                    key :'$ref', :ProfileDTO
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

          swagger_path "/profiles" do
            operation :post do
              key :summary, "Cadastra perfil no sistema"
              key :description, "Retorna o perfil cadastrado"
              key :operationId, "AddProfile"
              key :produces, [
                "application/json",
                "text/html",
              ]
              key :tags, [
                "Profile"
              ]
              parameter do
                key :name, :profile
                key :in, :body
                key :description, "Dados do Perfil"
                key :required, true
                schema do
                  key :'$ref', :ProfileInput
                end
              end

              response 200 do
                key :description, "Perfil"
                schema do
                  key :'$ref', :ProfileDTO
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

          swagger_path "/profiles/{id}" do
            operation :put do
              key :summary, "Edita perfil no sistema"
              key :description, "Retorna o perfil atualizado"
              key :operationId, "UpdateProfile"
              key :produces, [
                "application/json",
                "text/html",
              ]
              key :tags, [
                "Profile"
              ]

              parameter do
                key :name, :id
                key :type, :integer
                key :in, :path
                key :description, "ID do perfil"
                key :required, true
              end

              parameter do
                key :name, :profile
                key :in, :body
                key :description, "Dados do perfil"
                key :required, true
                schema do
                  key :'$ref', :ProfileInput
                end
              end

              response 200 do
                key :description, "Perfil"
                schema do
                  key :'$ref', :ProfileDTO
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

          swagger_path "/profiles/{id}" do
            operation :delete do
              key :summary, "Exclui perfil no sistema"
              key :description, "Exclui o perfil"
              key :operationId, "DestroyProfile"
              key :produces, [
                "application/json",
                "text/html",
              ]
              key :tags, [
                "Profile"
              ]

              parameter do
                key :name, :id
                key :type, :integer
                key :in, :path
                key :description, "ID do perfil"
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
