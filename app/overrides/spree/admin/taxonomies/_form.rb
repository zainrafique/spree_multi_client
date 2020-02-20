Deface::Override.new(
		virtual_path: "spree/admin/taxonomies/_form",
		name: "multi_client_admin_taxonomies_form_store_id",
		replace: "erb[loud]:contains('Spree::Store.all')",
		text: <<-HTML
					<% if defined?(current_spree_client) && current_spree_client %>
						<%= f.collection_select(:store_id, current_spree_client.stores, :id, :name, { include_blank: Spree.t('match_choices.none') }, { class: 'select2' }) %>
					<% else %>
						<%= f.collection_select(:store_id, Spree::Store.all, :id, :name, { include_blank: Spree.t('match_choices.none') }, { class: 'select2' }) %>
          <% end %>
HTML
)
