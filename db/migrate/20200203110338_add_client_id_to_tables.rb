class AddClientIdToTables < ActiveRecord::Migration[5.2]
  def change
  
    table_names = %w[
      orders
      users
      stores
      stock_locations
      shipping_methods
      prototypes
      taxonomies
      relation_types
      promotions
      promotion_categories
      gift_cards
      return_authorizations
      customer_returns
      vendors
      option_types
      properties
      tax_categories
      tax_rates
      zones
      countries
      states
      payment_methods
      shipping_categories
      stock_transfers
      store_credit_categories
      refund_reasons
      reimbursement_types
      return_authorization_reasons
      roles
    ]
  
    table_names.each do |table_name|
      add_reference "spree_#{table_name}", :client, index: true
    end
  end
end
