# frozen_string_literal: true

class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :name, :phone, :email, :document, :created_at, :updated_at
  belongs_to :user
  has_one :address
end
