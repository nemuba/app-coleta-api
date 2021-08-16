# frozen_string_literal: true

class SystemModuleSerializer < BaseSerializer
  attributes :id, :user_id, :name

  belongs_to :user
end
