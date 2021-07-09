# frozen_string_literal: true

class PointHistory < ApplicationRecord
  belongs_to :user
  belongs_to :collect
  belongs_to :collector, class_name: "User"
end
