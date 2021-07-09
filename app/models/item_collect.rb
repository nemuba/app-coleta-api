# frozen_string_literal: true

class ItemCollect < ApplicationRecord
  belongs_to :item
  belongs_to :collect
end
