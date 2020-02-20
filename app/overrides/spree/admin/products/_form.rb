Deface::Override.new(
		virtual_path: 'spree/admin/products/_form',
		name: 'populate_shipping_categories_according_to_user_role',
		replace: 'div[data-hook="admin_product_form_shipping_categories"]',
		text: <<-HTML
					<div data-hook="admin_product_form_shipping_categories">
						<% if defined?(current_spree_client) && current_spree_client %>
							<%= f.field_container :shipping_category, class: ['form-group'] do %>
			          <%= f.label :shipping_category_id, Spree.t(:shipping_category) %>
			          <%= f.collection_select(:shipping_category_id, current_spree_client.shipping_categories, :id, :name, { include_blank: Spree.t('match_choices.none') }, { class: 'select2' }) %>
			          <%= f.error_message_on :shipping_category %>
			        <% end %>
						<% else %>
							<%= f.field_container :shipping_category, class: ['form-group'] do %>
			          <%= f.label :shipping_category_id, Spree.t(:shipping_category) %>
			          <%= f.collection_select(:shipping_category_id, @shipping_categories, :id, :name, { include_blank: Spree.t('match_choices.none') }, { class: 'select2' }) %>
			          <%= f.error_message_on :shipping_category %>
			        <% end %>
	          <% end %>
					</div>
HTML
)

Deface::Override.new(
		virtual_path: 'spree/admin/products/_form',
		name: 'populate_tax_categories_according_to_user_role',
		replace: 'div[data-hook="admin_product_form_tax_category"]',
		text: <<-HTML
					<div data-hook="admin_product_form_tax_category">
						<% if defined?(current_spree_client) && current_spree_client %>
							<%= f.field_container :tax_category, class: ['form-group'] do %>
			          <%= f.label :tax_category_id, Spree.t(:tax_category) %>
			          <%= f.collection_select(:tax_category_id, current_spree_client.tax_categories, :id, :name, { include_blank: Spree.t('match_choices.none') }, { class: 'select2' }) %>
			          <%= f.error_message_on :tax_category %>
			        <% end %>
						<% else %>
							<%= f.field_container :tax_category, class: ['form-group'] do %>
			          <%= f.label :tax_category_id, Spree.t(:tax_category) %>
			          <%= f.collection_select(:tax_category_id, @tax_categories, :id, :name, { include_blank: Spree.t('match_choices.none') }, { class: 'select2' }) %>
			          <%= f.error_message_on :tax_category %>
			        <% end %>
	          <% end %>
					</div>
HTML
)

Deface::Override.new(
		virtual_path: 'spree/admin/products/_form',
		name: 'populate_product_stores_according_to_user_role',
		replace: 'p[data-hook="admin_product_form_stores"]',
		text: <<-HTML
					<div data-hook="admin_product_form_stores">
						<% if defined?(current_spree_client) && current_spree_client %>
							<%= f.field_container :stores, class: ['form-group'] do %>
			          <%= f.label :store_ids, Spree.t(:stores) %>
			          <%= f.collection_select(:store_ids, current_spree_client.stores, :id, :name, { include_blank: Spree.t('match_choices.none') }, { class: 'select2' }) %>
			        <% end %>
						<% else %>
							<%= f.field_container :stores, class: ['form-group'] do %>
			          <%= f.label :store_ids, Spree.t(:stores) %>
			          <%= f.collection_select(:store_ids, Spree::Store.all, :id, :name, { include_blank: Spree.t('match_choices.none') }, { class: 'select2' }) %>
			        <% end %>
	          <% end %>
					</div>
HTML
)
