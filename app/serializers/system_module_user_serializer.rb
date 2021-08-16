# frozen_string_literal: true

class SystemModuleUserSerializer < BaseSerializer
  attributes :id, :user_id, :system_module_id

  belongs_to :user
  belongs_to :system_module
end
