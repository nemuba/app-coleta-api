# frozen_string_literal: true

class ProductUserHistorySerializer < BaseSerializer
  attributes :id, :quantity, :total_points, :user_points

  belongs_to :product
  belongs_to :user
end
