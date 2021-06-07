# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user, system_module)
    if user.present?
      can :manage, :all if user.admin?

      @module_permitted ||= user.user_modules.pluck(:name).include?(system_module)
      
      if @module_permitted
        case system_module
        when "collect"
          can :manage, Product, user_id: user.id if user.business?
          can :manage, Profile, user_id: user.id if user.collector?
        end
      end
    end
  end
end
