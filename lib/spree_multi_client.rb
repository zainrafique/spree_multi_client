require 'spree_core'
require 'spree_extension'
require 'spree_multi_client/engine'
require 'spree_multi_client/version'

module SpreeMultiClient
	# TODO: this should be moved into preferences
	def self.clientized_models
		[
				Spree::User,
				Spree::OptionType,
				Spree::Property,
				Spree::Prototype,
				Spree::Taxonomy,
				Spree::RelationType,
				Spree::Promotion,
				Spree::PromotionCategory,
				Spree::Store,
				Spree::GiftCard,
				Spree::Vendor,
				Spree::ShippingMethod,
				Spree::StockLocation,
				Spree::TaxCategory,
				Spree::TaxRate,
				Spree::Zone,
				Spree::Country,
				Spree::State,
				Spree::PaymentMethod,
				Spree::ShippingCategory,
				Spree::StockTransfer,
				Spree::StoreCreditCategory,
				Spree::RefundReason,
				Spree::ReimbursementType,
				Spree::ReturnAuthorizationReason,
				Spree::Role,
				Spree::Vendor,
				Spree::Taxon,
				Spree::Product,
				Spree::Currency,
				Spree::Page
		]
	end
end
