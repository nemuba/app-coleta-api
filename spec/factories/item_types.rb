# frozen_string_literal: true

FactoryBot.define do
  factory :item_type do
    name { Faker::Commerce.department }
  end
end
