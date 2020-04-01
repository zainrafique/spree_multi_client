Spree::ReturnAuthorizationReason.class_eval do
	clear_validators!
	
	# validates :name, presence: true, uniqueness: { case_sensitive: false, scope: :client_id }
	
end
