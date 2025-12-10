# frozen_string_literal: true

FactoryBot.define do
  factory :recyclable do
    name { Faker::Science.element }
    unit_of_measurement { [:gram, :kilogram, :unity].sample }
    measure { Faker::Number.decimal(l_digits: 1, r_digits: 2) }
    point { Faker::Number.between(from: 1, to: 50) }
  end
end
