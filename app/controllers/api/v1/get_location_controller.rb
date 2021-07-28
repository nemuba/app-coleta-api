module Api
  module V1
    class GetLocationController < ApplicationController
      before_action :authenticate_and_set_user
      
      def create
        
      end

      private

      def location_params
        params.require(:coordinates).permit(:latitude, :longitude)
      end
    end
  end
end
