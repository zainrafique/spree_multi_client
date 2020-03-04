class RemoveIndexsAndAddNewIndexes < ActiveRecord::Migration[5.2]
  def change
    remove_index "spree_promotions", name: "index_spree_promotions_on_code"
    add_index :spree_promotions, [:code, :client_id], unique: true

    remove_index "spree_return_authorization_reasons", name: "index_spree_return_authorization_reasons_on_lower_name"
    add_index :spree_return_authorization_reasons, [:name, :client_id], unique: true

    remove_index "spree_reimbursement_types", name: "index_spree_reimbursement_types_on_lower_name"
    add_index :spree_reimbursement_types, [:name, :client_id], unique: true

    remove_index "spree_roles", name: "index_spree_roles_on_lower_name"
    add_index :spree_roles, [:name, :client_id], unique: true

    remove_index "spree_stores", name: "index_spree_stores_on_lower_code"
    add_index :spree_stores, [:code, :client_id], unique: true

    remove_index "spree_users", name: "email_idx_unique"
    add_index :spree_users, [:email, :client_id], unique: true
  end
end
