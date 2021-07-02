module Swagger
  class Registration
    include ::Swagger::Blocks

    swagger_schema :RegistrationDTO do
      property :email do
        key :type, :string
      end

      property :password do
        key :type, :string
      end

      property :password_confirmation do
        key :type, :string
      end

      property :role do
        key :type, :string
        key :format, "admin, collector, customer, business"
      end
    end
  end
end

