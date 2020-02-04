class Spree::ClientAbility
  include CanCan::Ability

  def initialize(user)
    if user.respond_to?(:has_spree_role?) && user.has_spree_role?('client')
      @client_id = user.client.id
      can :manage, :all
      apply_permissions
    end
  end
  
  private
  
  def apply_permissions
    SpreeMultiClient.clientized_models.each do |model|
      cannot :display, model
      can :manage, model, client_id: @client_id
      can :create, model
    end
  end
  
  
end
