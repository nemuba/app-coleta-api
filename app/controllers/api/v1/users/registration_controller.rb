# frozen_string_literal: true

module Api
  module V1
    module Users
      class RegistrationController < ApiGuard::RegistrationController
        before_action :authenticate_resource, only: [:destroy]

        def create
          init_resource(sign_up_params)
          if resource.save
            create_token_and_set_header(resource, resource_name)
            # render_success(message: I18n.t("api_guard.registration.signed_up"))
            render json: UserSerializer.new(resource).as_json
          else
            render_error(422, object: resource)
          end
        end

        def destroy
          current_resource.destroy
          render_success(message: I18n.t("api_guard.registration.account_deleted"))
        end

        private
          def sign_up_params
            params.require(:auth).permit(:email, :password, :password_confirmation, :role)
          end
      end
    end
  end
end
