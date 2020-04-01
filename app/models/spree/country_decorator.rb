Spree::Country.class_eval do
	clear_validators!
	# validates :name, :iso_name, :iso, :iso3, presence: true, uniqueness: { case_sensitive: false, scope: :client_id }
end
