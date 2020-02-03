class AddClientIdToTables < ActiveRecord::Migration[5.2]
  def change
    add_column :spree_orders, :client_id, :integer
    add_column :spree_users, :client_id, :integer
    add_column :spree_stores, :client_id, :integer
    add_column :spree_prototypes, :client_id, :integer
    add_column :spree_taxonomies, :client_id, :integer
    add_column :spree_relation_types, :client_id, :integer
    add_column :spree_promotions, :client_id, :integer
    add_column :spree_promotion_categories, :client_id, :integer
    add_column :spree_gift_cards, :client_id, :integer
    add_column :spree_return_authorizations, :client_id, :integer
    add_column :spree_customer_returns, :client_id, :integer
  
  
    add_index :spree_orders, :client_id
    add_index :spree_users, :client_id
    add_index :spree_stores, :client_id
    add_index :spree_prototypes, :client_id
    add_index :spree_taxonomies, :client_id
    add_index :spree_relation_types, :client_id
    add_index :spree_promotions, :client_id
    add_index :spree_promotion_categories, :client_id
    add_index :spree_gift_cards, :client_id
    add_index :spree_return_authorizations, :client_id
    add_index :spree_customer_returns, :client_id
  end
end
