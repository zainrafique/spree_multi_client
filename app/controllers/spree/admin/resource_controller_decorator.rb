Spree::Admin::ResourceController.class_eval do
	before_action :set_client_id, only: [:create, :update]
	
  def set_client_id
    return unless current_spree_client
    params[resource.object_name.to_sym][:client_id] = current_spree_client.id
    puts "params"*78
    puts params
  end
end
