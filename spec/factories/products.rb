# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    user { association :user, :business }
    name { Faker::Commerce.product_name }
    price { Faker::Commerce.price(range: 10.0..500.0) }
    point { Faker::Number.decimal(l_digits: 2, r_digits: 1) }
  end
end
