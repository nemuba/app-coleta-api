# frozen_string_literal: true

class ConfigSerializer < BaseSerializer
  attributes :id, :param, :value
  has_one :system_module
end
