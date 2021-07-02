module Swagger
  class Authentication
    include ::Swagger::Blocks

    swagger_schema :AuthenticationDTO do
      property :email do
        key :type, :string
      end

      property :password do
        key :type, :string
      end
    end
  end
end

