Spree::Admin::ZonesController.class_eval do
  
  
  protected
	 
  def load_data
    @countries = Country.order(:name)
    @states = State.order(:name)
    @zones = (defined?(current_spree_client) && current_spree_client) ? current_spree_client.zones.order(:name) :  Zone.order(:name)
  end

end
