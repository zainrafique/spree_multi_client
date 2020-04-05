Spree::Admin::ZonesController.class_eval do
  
  
  protected
	 
  def load_data
    @countries = (defined?(current_spree_client) && current_spree_client) ? current_spree_client.countries.order(:name) :  Country.order(:name)
    @states = (defined?(current_spree_client) && current_spree_client) ? current_spree_client.states.order(:name) :  State.order(:name)
    @zones = (defined?(current_spree_client) && current_spree_client) ? current_spree_client.zones.order(:name) :  Zone.order(:name)
  end

end
