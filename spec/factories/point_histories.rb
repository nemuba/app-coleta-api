# frozen_string_literal: true

FactoryBot.define do
  factory :point_history do
    user { association :user, :business }
    collect
    collector { association :user, :collector }
    value { Faker::Number.between(from: 1, to: 100) }
  end
end
