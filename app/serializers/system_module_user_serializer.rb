# frozen_string_literal: true

class SystemModuleUserSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :system_module_id

  belongs_to :user
  belongs_to :system_module
end
