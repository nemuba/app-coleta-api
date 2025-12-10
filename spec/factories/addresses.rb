# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    profile
    street { Faker::Address.street_name }
    neighborhood { Faker::Address.community }
    number { Faker::Address.building_number }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    country { Faker::Address.country }
    zip_code { Faker::Address.zip_code }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
  end
end
