Spree::OptionType.class_eval do
	clear_validators!
	
	with_options presence: true do
		# validates :name, uniqueness: { case_sensitive: false, allow_blank: true, scope: :client_id }
		validates :presentation
	end
	
	def name_with_presentation
		"#{self.presentation} (#{self.name})"
	end
end
