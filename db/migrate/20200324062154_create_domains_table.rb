class CreateDomainsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :spree_domains do |t|
      t.string :name
      t.integer :client_id
    end
  end
end
