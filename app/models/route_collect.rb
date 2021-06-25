# frozen_string_literal: true

class RouteCollect < ApplicationRecord
  belongs_to :route
  belongs_to :collect
end
