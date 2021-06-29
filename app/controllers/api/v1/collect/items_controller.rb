# frozen_string_literal: true

module Api
  module V1
    module Collect
      class ItemsController < ApplicationController
        before_action :authenticate_and_set_user
        before_action :set_item, only: [:show, :update, :destroy]
        load_and_authorize_resource

        # GET /items
        def index
          @items = Item.all

          json_response(@items)
        end

        # GET /items/1
        def show
          json_response(@item)
        end

        # POST /items
        def create
          @item = Item.new(item_params)

          if @item.save
            json_response(@item, :created)
          else
            json_response_error(@item.errors)
          end
        end

        # PATCH/PUT /items/1
        def update
          if @item.update(item_params)
            json_response(@item)
          else
            json_response_error(@item.errors)
          end
        end

        # DELETE /items/1
        def destroy
          @item.destroy
        end

        private
          # Use callbacks to share common setup or constraints between actions.
          def set_item
            @item = Item.find(params[:id])
          end

          # Only allow a list of trusted parameters through.
          def item_params
            params.require(:item).permit(
              :point,
              :point_weight,
              :name,
              :item_type_id,
              item_collects_attributes: [:id, :collect_id, :weight, :_destroy]
            )
          end
      end
    end
  end
end
