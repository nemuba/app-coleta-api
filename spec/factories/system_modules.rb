# frozen_string_literal: true

FactoryBot.define do
  factory :system_module do
    user { association :user, :business }
    name { Faker::App.name.downcase.gsub(/\s+/, "_") }
  end
end
