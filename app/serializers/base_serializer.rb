# frozen_string_literal: true

class BaseSerializer < ActiveModel::Serializer
  attributes :created_at, :updated_at

  def created_at
    object.created_at.strftime("%d/%m/%Y")
  end

  def updated_at
    object.updated_at.strftime("%d/%m/%Y")
  end
end
