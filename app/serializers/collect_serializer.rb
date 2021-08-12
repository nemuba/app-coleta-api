# frozen_string_literal: true

class CollectSerializer < BaseSerializer
  attributes :id, :user_id, :note

  has_one :user
  has_one :collect_status
end
