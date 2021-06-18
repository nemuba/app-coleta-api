# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user, system_module)
    return unless user.present?

    @module_permitted ||= user.user_modules.pluck(:name).include?(system_module)

    return unless @module_permitted

    can :manage, Route, user_id: user.id
    can :manage, Profile, user_id: user.id
    can :manage, User, user_id: user.id
    can :manage, Collect, user_id: user.id

    return unless user.admin?

    can :manage, :all
  end
end
