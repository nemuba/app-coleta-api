# frozen_string_literal: true

class SystemModuleSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :name, :created_at, :updated_at

  belongs_to :user
end
