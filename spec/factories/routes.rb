# frozen_string_literal: true

FactoryBot.define do
  factory :route do
    user { association :user, :collector }
    collect_date { Faker::Date.forward(days: 7) }
    request_date { Faker::Time.backward(days: 1) }
    status { :pending }

    trait :finished do
      status { :finished }
    end
  end
end
