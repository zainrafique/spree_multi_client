class AddNewAttributeToClient < ActiveRecord::Migration[5.2]
  def change
    add_column :spree_clients, :supported_currencies, :text
  end
end
