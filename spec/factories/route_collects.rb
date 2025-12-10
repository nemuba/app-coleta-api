# frozen_string_literal: true

FactoryBot.define do
  factory :route_collect do
    route
    collect
    order { Faker::Number.between(from: 1, to: 10) }
  end
end
