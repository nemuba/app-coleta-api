# frozen_string_literal: true

class SystemModuleSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :name

  belongs_to :user
end
