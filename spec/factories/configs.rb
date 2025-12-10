# frozen_string_literal: true

FactoryBot.define do
  factory :config do
    system_module
    param { Faker::Lorem.word }
    value { Faker::Number.between(from: 1, to: 100) }
  end
end
