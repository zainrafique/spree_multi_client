module Spree
  class Client < Spree::Base
    has_many :users
    has_many :option_types
    has_many :vendors
    has_many :properties
    has_many :prototypes
    has_many :taxonomies
    has_many :relation_types
    has_many :promotions
    has_many :promotion_categories
    has_many :gift_cards
    has_many :promotions
    has_many :tax_categories
    has_many :tax_rates
    has_many :zones
    has_many :countries
    has_many :states
    has_many :payment_methods
    has_many :shipping_categories
    has_many :stock_transfers
    has_many :store_credit_categories
    has_many :refund_reasons
    has_many :reimbursement_types
    has_many :return_authorization_reasons
    has_many :roles
    has_many :stores
    has_many :taxons
    
  end
end
