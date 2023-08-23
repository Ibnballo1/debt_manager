# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    user ||= User.new # Guest user

    return unless user.present?
    can :manage, Debt, user: user
  end
end
