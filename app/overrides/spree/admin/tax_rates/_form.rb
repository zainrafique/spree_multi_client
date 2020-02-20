Deface::Override.new(
		virtual_path: 'spree/admin/tax_rates/_form',
		name: 'populate_tax_rates_zones_according_to_user_role',
		replace: 'div[data-hook="zone"]',
		text: <<-HTML
					<div data-hook="zone">
						<% if defined?(current_spree_client) && current_spree_client %>
							<%= f.label :zone, Spree.t(:zone) %>
              <%= f.collection_select(:zone_id, current_spree_client.zones, :id, :name, {}, {class: 'select2'}) %>
						<% else %>
							<%= f.label :zone, Spree.t(:zone) %>
              <%= f.collection_select(:zone_id, @available_zones, :id, :name, {}, {class: 'select2'}) %>
	          <% end %>
					</div>
HTML
)

Deface::Override.new(
		virtual_path: 'spree/admin/tax_rates/_form',
		name: 'populate_tax_rates_tax_categories_according_to_user_role',
		replace: 'div[data-hook="category"]',
		text: <<-HTML
					<div data-hook="category">
						<% if defined?(current_spree_client) && current_spree_client %>
							<%= f.label :tax_category_id, Spree.t(:tax_category) %>
              <%= f.collection_select(:tax_category_id, current_spree_client.tax_categories,:id, :name, {}, {class: 'select2'}) %>
						<% else %>
							<%= f.label :tax_category_id, Spree.t(:tax_category) %>
              <%= f.collection_select(:tax_category_id, @available_categories,:id, :name, {}, {class: 'select2'}) %>
	          <% end %>
					</div>
HTML
)
