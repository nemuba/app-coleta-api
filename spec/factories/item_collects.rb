# frozen_string_literal: true

FactoryBot.define do
  factory :item_collect do
    item
    collect
    weight { Faker::Number.decimal(l_digits: 1, r_digits: 2) }
  end
end
