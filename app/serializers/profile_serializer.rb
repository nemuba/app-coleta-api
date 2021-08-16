# frozen_string_literal: true

class ProfileSerializer < BaseSerializer
  attributes :id, :user_id, :name, :phone, :email, :document
  belongs_to :user
  has_one :address
end
