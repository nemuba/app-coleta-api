# frozen_string_literal: true

FactoryBot.define do
  factory :collect do
    user { association :user, :business }
    note { Faker::Lorem.sentence }

    trait :with_status do
      after(:create) do |collect|
        create(:collect_status, collect: collect)
      end
    end
  end
end
