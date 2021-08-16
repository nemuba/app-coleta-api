# frozen_string_literal: true

class ItemCollectSerializer < BaseSerializer
  attributes :id, :item_id, :collect_id

  has_one :collect
end
