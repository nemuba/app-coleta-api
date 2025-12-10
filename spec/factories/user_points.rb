# frozen_string_literal: true

FactoryBot.define do
  factory :user_point do
    user { association :user, :business }
    value { Faker::Number.between(from: 0, to: 1000) }
  end
end
