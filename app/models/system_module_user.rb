# frozen_string_literal: true

class SystemModuleUser < ApplicationRecord
  belongs_to :user
  belongs_to :system_module
end
