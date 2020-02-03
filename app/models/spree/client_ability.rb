class Spree::ClientAbility
  include CanCan::Ability

  def initialize(user)
    if user.respond_to?(:has_spree_role?) && user.has_spree_role?('client')
      can :manage, :all, :client_id => user.client.id
    end

  end
end
