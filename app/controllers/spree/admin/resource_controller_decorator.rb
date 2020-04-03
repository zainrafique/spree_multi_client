Spree::Admin::ResourceController.class_eval do
	before_action :set_client_id, only: [:create, :update]
	
  def set_client_id
    return unless current_spree_client
    return if request.put? && resource.object_name == 'reimbursement_type'
    class_name_of_object = "Spree::" + resource.object_name.titleize.delete(' ')
    params[resource.object_name.to_sym][:client_id] = current_spree_client&.id if class_name_of_object.constantize.column_names.include? 'client_id'
  end
end
