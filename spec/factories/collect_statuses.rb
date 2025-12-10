# frozen_string_literal: true

FactoryBot.define do
  factory :collect_status do
    collect
    name { ["Aguardando Confirmação", "Em Andamento", "Coletado", "Cancelado"].sample }
  end
end
