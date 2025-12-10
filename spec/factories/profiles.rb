# frozen_string_literal: true

FactoryBot.define do
  factory :profile do
    user { association :user, :business }
    name { Faker::Name.name }
    phone { Faker::PhoneNumber.cell_phone }
    email { Faker::Internet.email }
    document { Faker::Number.number(digits: 11).to_s }

    trait :with_address do
      after(:create) do |profile|
        create(:address, profile: profile)
      end
    end
  end
end
