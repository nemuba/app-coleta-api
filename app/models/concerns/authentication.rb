# frozen_string_literal: true

require "active_support/concern"

module Authentication
  extend ActiveSupport::Concern

  included do
    has_secure_password
    has_secure_token

    api_guard_associations refresh_token: "refresh_tokens"
    has_many :refresh_tokens, dependent: :delete_all
  end
end
