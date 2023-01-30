# frozen_string_literal: true

# Bussines: This class is used to manage the bussines logic
class Collector < ApplicationRecord
  self.table_name = "users"
  self.primary_key = "id"

  has_many :routes, foreign_key: :user_id, dependent: :destroy, inverse_of: :user

  default_scope { where(role: User.roles[:collector]) }
end
