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

        tag do
          key :name, "Authentication"
          key :description, "User authentication operations (Sign up, Sign in, Token refresh, Password change)"
        end

        tag do
          key :name, "Recyclables"
          key :description, "Recyclable materials management"
        end

        tag do
          key :name, "Configs"
          key :description, "System configurations (Admin only)"
        end

        tag do
          key :name, "Current User"
          key :description, "Current authenticated user operations"
        end

        tag do
          key :name, "Location"
          key :description, "Geolocation services"
        end

        tag do
          key :name, "Customers"
          key :description, "Customer management"
        end

        tag do
          key :name, "Exchange Points"
          key :description, "Points exchange for products"
        end
        key :host, "app-coleta-api.herokuapp.com"
        key :basePath, "/api/v1"
        key :consumes, ["application/json"]
        key :produces, ["application/json"]
      end

      # A list of all classes that have swagger_* declarations.
      SWAGGERED_CLASSES = [
        # Error Model
        ::Swagger::ErrorModel,

        # Collect Module Controllers & DTOs
        ::Api::V1::Collect::Swagger::CollectsController,
        ::Swagger::Collect,
        ::Swagger::CollectStatus,
        ::Api::V1::Collect::Swagger::ProfilesController,
        ::Swagger::Profile,
        ::Api::V1::Collect::Swagger::UsersController,
        ::Swagger::User,
        ::Api::V1::Collect::Swagger::ProductsController,
        ::Swagger::Product,
        ::Api::V1::Collect::Swagger::RoutesController,
        ::Swagger::Route,
        ::Swagger::RouteCollect,
        ::Api::V1::Collect::Swagger::ItemsController,
        ::Swagger::Item,
        ::Swagger::ItemCollect,
        ::Api::V1::Collect::Swagger::PointHistoriesController,
        ::Swagger::PointHistory,
        ::Api::V1::Collect::Swagger::CustomersController,
        ::Swagger::Customer,
        ::Api::V1::Collect::Swagger::ExchangePointsController,
        ::Swagger::ExchangePoint,

        # System Module Controllers & DTOs
        ::Api::V1::Swagger::SystemModulesController,
        ::Swagger::SystemModule,
        ::Api::V1::Swagger::SystemModuleUserController,
        ::Swagger::SystemModuleUser,
        ::Swagger::Address,
        ::Swagger::UserPoint,
        ::Api::V1::Swagger::ItemTypesController,
        ::Swagger::ItemType,

        # ApiGuard Authentication Controllers & DTOs
        ::Api::V1::Users::Swagger::AuthenticationController,
        ::Api::V1::Users::Swagger::RegistrationController,
        ::Api::V1::Users::Swagger::TokensController,
        ::Api::V1::Users::Swagger::PasswordsController,
        ::Swagger::Authentication,
        ::Swagger::Registration,
        ::Swagger::PasswordChange,

        # New Controllers & DTOs
        ::Api::V1::Swagger::RecyclablesController,
        ::Swagger::Recyclable,
        ::Api::V1::Swagger::ConfigsController,
        ::Swagger::Config,
        ::Api::V1::Swagger::CurrentUsersController,
        ::Api::V1::Swagger::GetLocationController,
        ::Swagger::Location,

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
