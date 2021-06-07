module Api
  module V1
    module Collect
      class UsersController < ApplicationController
        before_action :authenticate_and_set_user
        before_action :set_profile, only: %i[show update destroy]
        
        def index
          @users = User.all

          authorize! :read, @users

          json_response(@users)
        end

        def show
          authorize! :read, @user

          json_response(@user)
        end

        def update
          authorize! :update, @user
          
          if @user.update(user_params)
            json_response(@user)
          else
            json_response_error(@user.error)
          end
        end

        def destroy
          authorize! :destroy, @user

          @user.destroy
        end

        private
        
        def user_params
          params.require(:user).permit(:email, :password, :password_confirmation, :role)
        end

        def set_user
          @user = User.find(params[:id])
        end
      end
    end
  end
end
