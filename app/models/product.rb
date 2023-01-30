# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :user

  has_many :product_user_histories, dependent: :destroy
end
