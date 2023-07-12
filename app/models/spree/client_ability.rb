class Spree::ClientAbility
  include CanCan::Ability

  def initialize(user)
    if user.respond_to?(:has_spree_role?) && user.has_spree_role?('client')
      @client_id = user.client.id
      can :manage, :all
      apply_permissions
      apply_order_permissions
      apply_question_permissions(user)
      # apply_product_permissions
    elsif user.respond_to?(:has_spree_role?) && user.has_spree_role?('sub_client')
      @client_id = user.client.id
      can :manage, :all
      apply_permissions
      sub_client_stores(user)
      sub_client_questions(user)
    end
  end
  
  private
  
  def apply_permissions
    SpreeMultiClient.clientized_models.each do |model|
      cannot :read, model
      can :manage, model, client_id: @client_id
      can :create, model
    end
  end

  def sub_client_stores(user)
    cannot :read, Spree::Store
    can :manage, Spree::Store, {client_id: @client_id, id: user&.allow_store_ids}
    can :create, Spree::Store
  end

  def sub_client_questions(user)
    cannot :read, Spree::Question
    can :manage, Spree::Question, {store_id: user&.allow_store_ids}
    can :create, Spree::Question
  end

  def apply_order_permissions
    cannot :create, Spree::Order
    can [:admin, :index, :edit, :update, :cart], Spree::Order, line_items: { product: { vendor: { client_id: @client_id } } }
  end

  def apply_product_permissions
    cannot :read, Spree::Product
    can :manage, Spree::Product, vendor: {client_id: @client_id}
    can :create, Spree::Product
  end

  def apply_question_permissions(user)
    vendor_ids = user.client.vendors.ids
    cannot :read, Spree::Question
    can :manage, Spree::Question, {vendor_id: vendor_ids}
    can :create, Spree::Question
  end
  
  
end
