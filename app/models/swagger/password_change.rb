# frozen_string_literal: true

module Swagger
  class PasswordChange
    include ::Swagger::Blocks

    swagger_schema :PasswordChangeDTO do
      key :required, [:password, :password_confirmation]

      property :password do
        key :type, :string
        key :format, :password
        key :description, "Nova senha"
        key :minLength, 6
      end

      property :password_confirmation do
        key :type, :string
        key :format, :password
        key :description, "Confirmação da nova senha"
      end
    end
  end
end
