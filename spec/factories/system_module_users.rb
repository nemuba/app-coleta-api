# frozen_string_literal: true

FactoryBot.define do
  factory :system_module_user do
    user { association :user, :business }
    system_module
  end
end
