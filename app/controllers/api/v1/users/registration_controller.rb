# frozen_string_literal: true

module Api
  module V1
    module Users
      class RegistrationController < ApiGuard::RegistrationController
        before_action :authenticate_resource, only: [:destroy]
        after_action :set_user_point, only: [:create]

        def create
          user_params = sign_up_params
          init_resource(user_params.except(:token))
          if resource.save
            create_token_and_set_header(resource, resource_name)
            # render_success(message: I18n.t('api_guard.registration.signed_up'))

            render json: resource
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
            params.require(:auth).permit(:email, :password, :password_confirmation, :role, :token)
          end

          def set_user_point
            return unless params[:auth][:token].present?

            user = User.find_by_token(params[:auth][:token])
            return unless user

            user_point = Config.find_by_param("user_point")

            unless user.user_point.present?
              user.update!(user_point_attributes: { value: user_point.value })
            else
              points = user.user_point
              user.update!(user_point_attributes: { id: points.id, value: points.value + user_point.value })
            end
          end
      end
    end
  end
end
