Spree::Admin::ZonesController.class_eval do
  
  
  protected
	 
  def load_data
    @countries = Spree::Country.order(:name)
    @states = Spree::State.order(:name)
    @zones = (defined?(current_spree_client) && current_spree_client) ? current_spree_client.zones.order(:name) :  Spree::Zone.order(:name)
  end

end
