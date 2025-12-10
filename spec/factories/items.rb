# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    item_type
    name { Faker::Commerce.product_name }
    point { Faker::Number.between(from: 1, to: 100) }
    point_weight { Faker::Number.decimal(l_digits: 1, r_digits: 2) }
  end
end
