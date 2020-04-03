Deface::Override.new(
		virtual_path: "spree/admin/products/index",
		name: "multi_client_admin_product_filter_store_id",
		replace: "erb[loud]:contains('Spree::Store.all')",
		text: <<-HTML
					<% if defined?(current_spree_client) && current_spree_client %>
						<%= f.collection_select(:stores_id_eq, current_spree_client.stores, :id, :name, { include_blank: Spree.t('match_choices.none') }, { class: 'select2' }) %>
					<% else %>
						<%= f.collection_select(:stores_id_eq, Spree::Store.all, :id, :name, { include_blank: Spree.t('match_choices.none') }, { class: 'select2' }) %>
          <% end %>
HTML
)
