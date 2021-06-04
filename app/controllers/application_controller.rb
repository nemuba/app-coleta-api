# frozen_string_literal: true

class ApplicationController < ActionController::API
  include HandlerErrors
  include Response

  def current_ability
    @current_ability ||= Ability.new(current_user, request.path.split("/")[3])
  end
end
