Spree::State.class_eval do
	clear_validators!
	
	validates :country, :name, presence: true
	# validates :name, :abbr, uniqueness: { case_sensitive: false, scope: [:country_id, :client_id] }, allow_blank: true
	
end
