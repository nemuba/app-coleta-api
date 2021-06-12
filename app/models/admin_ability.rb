# frozen_string_literal: true

class AdminAbility
  include CanCan::Ability

  def initialize(user)
    return unless user.present? && user.admin?

    can :manage, :all
  end
end
