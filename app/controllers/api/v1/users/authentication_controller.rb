# frozen_string_literal: true

module Api
  module V1
    module Users
      class AuthenticationController < ApiGuard::AuthenticationController
        before_action :find_resource, only: [:create]
        before_action :authenticate_resource, only: [:destroy]

        def create
          if resource.authenticate(resource_params[:password])
            create_token_and_set_header(resource, resource_name)
            # render_success(message: I18n.t('api_guard.authentication.signed_in'))
            render json: UserSerializer.new(resource, include: ["profile", "profile.address"]).as_json
          else
            render_error(422,
                         message: I18n.t("api_guard.authentication.invalid_login_credentials"))
          end
        end

        def destroy
          blacklist_token
          render_success(message: I18n.t("api_guard.authentication.signed_out"))
        end

        private
          def find_resource
            if resource_params[:email].present?
              self.resource = resource_class.find_by(email: resource_params[:email].downcase.strip)
            end
            unless resource
              render_error(422,
                           message: I18n.t("api_guard.authentication.invalid_login_credentials"))
            end
          end

          def resource_params
            params.require(:auth).permit(:email, :password)
          end
      end
    end
  end
end
