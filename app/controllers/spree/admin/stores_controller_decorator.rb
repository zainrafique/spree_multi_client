Spree::Admin::StoresController.class_eval do
  
  
  private
    def load_payment_methods
      @payment_methods = (defined?(current_spree_client) && current_spree_client) ? current_spree_client.payment_methods :  Spree::PaymentMethod.all
    end
    
    def load_shipping_methods
      @shipping_methods = Spree::ShippingMethod.all
      @shipping_methods = (defined?(current_spree_client) && current_spree_client) ? current_spree_client.shipping_methods :  Spree::ShippingMethod.all
    end

end
