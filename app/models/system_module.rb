# frozen_string_literal: true

class SystemModule < ApplicationRecord
  belongs_to :user
  has_many :system_module_users, dependent: :destroy
  has_many :configs, dependent: :destroy
end
