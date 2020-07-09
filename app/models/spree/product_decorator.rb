Spree::Product.class_eval do
	clear_validators!
	
	before_validation :normalize_slug, on: :update
	before_validation :validate_master
	
	with_options presence: true do
		validates :name, :shipping_category
		validates :price, if: proc { Spree::Config[:require_master_price] }
	end
	
	validates :slug, presence: true, uniqueness: { allow_blank: true }
	validate :discontinue_on_must_be_later_than_available_on, if: -> { available_on && discontinue_on }
	
end
