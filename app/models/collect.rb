# frozen_string_literal: true

class Collect < ApplicationRecord
  belongs_to :user
  has_one :collect_status, dependent: :destroy

  accepts_nested_attributes_for :collect_status, allow_destroy: true
end
