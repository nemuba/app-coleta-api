# frozen_string_literal: true

class RouteCollect < ApplicationRecord
  belongs_to :route
  belongs_to :collect

  before_destroy :remove_collect_status

  def remove_collect_status
    collect.update(collect_status_attributes: { id: collect.collect_status.id, name: "Aguardando Confirmação" })
  end
end
