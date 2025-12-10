# frozen_string_literal: true

FactoryBot.define do
  factory :refresh_token do
    user { association :user, :business }
    token { Faker::Alphanumeric.alphanumeric(number: 32) }
    expire_at { Faker::Time.forward(days: 7) }
  end
end
