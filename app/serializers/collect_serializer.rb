# frozen_string_literal: true

class CollectSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :note, :created_at, :updated_at

  has_one :user
  has_one :collect_status

  def created_at
    object.created_at.strftime("%d/%m/%Y")
  end
end
