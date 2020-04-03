class RemoveAddIndex < ActiveRecord::Migration[5.2]
  def change
    remove_index "spree_countries", name: "index_spree_countries_on_lower_iso_name"
    add_index :spree_countries, [:iso_name, :client_id], unique: true

    remove_index "spree_countries", name: "index_spree_countries_on_lower_name"
    add_index :spree_countries, [:name, :client_id], unique: true
  end
end
