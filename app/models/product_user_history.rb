# frozen_string_literal: true

# ProductUserHistory: save the history of the user's points when he buys a product
class ProductUserHistory < ApplicationRecord
  belongs_to :product
  belongs_to :user

  before_save :set_user_points


  def set_user_points
    self.user.user_point.update(value: user.user_point.value - self.total_points)
  end
end
