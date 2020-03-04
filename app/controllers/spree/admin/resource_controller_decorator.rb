Spree::Admin::ResourceController.class_eval do
	before_action :set_client_id, only: [:create, :update]
	
  def set_client_id
    return unless current_spree_client
    return if request.put? && resource.object_name == 'reimbursement_type'
    params[resource.object_name.to_sym][:client_id] = current_spree_client&.id
    
  end
end
