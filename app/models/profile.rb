# frozen_string_literal: true

class Profile < ApplicationRecord
  belongs_to :user
  has_one :address, dependent: :destroy

  accepts_nested_attributes_for :address, allow_destroy: true
end
