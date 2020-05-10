Spree::Admin::StatesController.class_eval do
  
  
  protected
  def load_data
    # @countries = (defined?(current_spree_client) && current_spree_client) ? current_spree_client.countries : Country.order(:name)
    @countries = Country.order(:name)
  end

end
