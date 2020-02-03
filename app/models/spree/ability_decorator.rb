module SpreeClient
  module AbilityActivator
    private
    def abilities_to_register
      super << Spree::ClientAbility
    end
  end
end

Spree::Ability.prepend SpreeClient::AbilityActivator
