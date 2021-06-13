# frozen_string_literal: true

module Api
  module V1
    class ApiDocsController < ActionController::Base
      include ::Swagger::Blocks

      swagger_root do
        key :swagger, "2.0"
        info do
          key :version, "1.0.0"
          key :title, "Swagger Collect API"
          key :description, "API para sistema de gerenciamento de coleta"
          key :termsOfService, "http://helloreverb.com/terms/"
          contact do
            key :name, "nemubatubag@gmail.com"
          end
          license do
            key :name, "MIT"
          end
        end

        security_definition :api_key do
          key :type, :apiKey
          key :name, :Authorization
          key :in, :header
        end

        tag do
          key :name, "collect"
          key :description, "Collect operations"
          externalDocs do
            key :description, "Find more info here"
            key :url, "https://swagger.io"
          end
        end
        key :host, "app-coleta-api.herokuapp.com"
        key :basePath, "/api/v1"
        key :consumes, ["application/json"]
        key :produces, ["application/json"]
      end

      # A list of all classes that have swagger_* declarations.
      SWAGGERED_CLASSES = [
        ::Swagger::ErrorModel,
        ::Api::V1::Collect::Swagger::CollectsController,
        ::Swagger::Collect,
        ::Swagger::CollectStatus,
        ::Api::V1::Collect::Swagger::ProfilesController,
        ::Swagger::Profile,
        ::Api::V1::Collect::Swagger::UsersController,
        ::Swagger::User,
        ::Api::V1::Collect::Swagger::ProductsController,
        ::Swagger::Product,
        ::Api::V1::Swagger::SystemModulesController,
        ::Swagger::SystemModule,
        ::Swagger::Address,
        self,
      ].freeze

      def index
        swagger_data = ::Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
        File.open("./swagger/swagger.json", "wb+") { |file| file.write(swagger_data.to_json) }

        render json: swagger_data
      end
    end
  end
end
