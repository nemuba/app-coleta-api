# frozen_string_literal: true

module HandlerErrors
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, ActiveRecord::RecordInvalid, ActiveRecord::RecordNotUnique,
                CanCan::AccessDenied, with: :record_invalid
  end

  def record_invalid(exception)
    json_response({ status: "error", error: exception.message }, :unprocessable_entity)
  end
end
