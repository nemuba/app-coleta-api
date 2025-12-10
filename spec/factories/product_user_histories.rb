# frozen_string_literal: true

FactoryBot.define do
  factory :product_user_history do
    product
    user { association :user, :business }
    quantity { Faker::Number.between(from: 1, to: 5) }
    total_points { Faker::Number.between(from: 10, to: 500) }
    user_points { Faker::Number.between(from: 0, to: 1000) }
  end
end
