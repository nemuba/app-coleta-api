# frozen_string_literal: true

# frozen_literal_string: true

module Api
  module V1
    class ItemTypesController < ApplicationController
      before_action :authenticate_and_set_user
      load_and_authorize_resource
      before_action :set_item_type, only: [:show, :update, :destroy]

      # GET /item_types
      def index
        @item_types = ItemType.all

        json_response(@item_types)
      end

      # GET /item_types/1
      def show
        json_response(@item_type)
      end

      # POST /item_types
      def create
        @item_type = ItemType.new(item_type_params)

        if @item_type.save
          json_response(@item_type, :created)
        else
          json_response_error(@item_type.errors)
        end
      end

      # PATCH/PUT /item_types/1
      def update
        if @item_type.update(item_type_params)
          json_response(@item_type)
        else
          json_response_error(@item_type.errors)
        end
      end

      # DELETE /item_types/1
      def destroy
        @item_type.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_item_type
          @item_type = ItemType.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def item_type_params
          params.require(:item_type).permit(:name)
        end
    end
  end
end
