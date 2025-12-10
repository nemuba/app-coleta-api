# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password { "password123" }
    password_confirmation { "password123" }
    role { :customer }

    trait :admin do
      role { :admin }
    end

    trait :collector do
      role { :collector }
    end

    trait :business do
      role { :business }
    end

    trait :with_profile do
      after(:create) do |user|
        create(:profile, user: user)
      end
    end
  end
end
