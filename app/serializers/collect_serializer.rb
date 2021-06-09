class CollectSerializer < ActiveModel::Serializer
  attributes :id, :note
  has_one :user
  has_one :collect_status
end
