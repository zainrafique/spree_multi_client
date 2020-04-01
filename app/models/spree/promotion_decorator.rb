Spree::Promotion.class_eval do
	clear_validators!
	
	validates_associated :rules
	
	validates :name, presence: true
	# validates :path, :code, uniqueness: { case_sensitive: false, allow_blank: true, scope: :client_id }
	validates :usage_limit, numericality: { greater_than: 0, allow_nil: true }
	validates :description, length: { maximum: 255 }, allow_blank: true
	validate :expires_at_must_be_later_than_starts_at, if: -> { starts_at && expires_at }
	
end
