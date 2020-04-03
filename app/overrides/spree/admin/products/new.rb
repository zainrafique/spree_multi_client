Deface::Override.new(
		virtual_path: 'spree/admin/products/new',
		name: 'populate_prototypes_on_new_product_according_to_user_role',
		replace: 'div[data-hook="new_product_prototype"]',
		text: <<-HTML
					<div data-hook="new_product_prototype">
						<% if defined?(current_spree_client) && current_spree_client %>
							<%= f.field_container :prototype, class: ['form-group'] do %>
			          <%= f.label :prototype_id, Spree.t(:prototype) %>
			          <%= f.collection_select :prototype_id, current_spree_client.prototypes, :id, :name, {include_blank: true}, {class: 'select2'} %>
			        <% end %>
						<% else %>
							<%= f.field_container :prototype, class: ['form-group'] do %>
			          <%= f.label :prototype_id, Spree.t(:prototype) %>
			          <%= f.collection_select :prototype_id, Spree::Prototype.all, :id, :name, {include_blank: true}, {class: 'select2'} %>
			        <% end %>
	          <% end %>
					</div>
HTML
)


Deface::Override.new(
		virtual_path: 'spree/admin/products/new',
		name: 'populate_shipping_categories_on_new_product_according_to_user_role',
		replace: 'div[data-hook="new_product_shipping_category"]',
		text: <<-HTML
					<div data-hook="new_product_shipping_category" class="col-xs-12 col-md-4">
						<% if defined?(current_spree_client) && current_spree_client %>
							<%= f.field_container :shipping_category, class: ['form-group'] do %>
			          <%= f.label :shipping_category_id, Spree.t(:shipping_categories) %><span class="required">*</span>
			          <%= f.collection_select :shipping_category_id, current_spree_client.shipping_categories, :id, :name, {include_blank: Spree.t('match_choices.none')}, {class: 'select2', required: :required} %>
			        <% end %>
						<% else %>
							<%= f.field_container :shipping_category, class: ['form-group'] do %>
			          <%= f.label :shipping_category_id, Spree.t(:shipping_categories) %><span class="required">*</span>
			          <%= f.collection_select :shipping_category_id, @shipping_categories, :id, :name, {include_blank: Spree.t('match_choices.none')}, {class: 'select2', required: :required} %>
			        <% end %>
	          <% end %>
					</div>
HTML
)
