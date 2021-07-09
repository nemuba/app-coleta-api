# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :item_type

  has_many :item_collects
  accepts_nested_attributes_for :item_collects, allow_destroy: true
end
