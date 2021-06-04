# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user, system_module)
    if user.present?
      module_permitted = user.user_modules.pluck(:name).include?(system_module)

      can :manage, :all if user.admin?

      case system_module
      when "collect" && module_permitted
        can :manage, Profile, user_id: user.id if user.collector?
      end

    end
  end
end
