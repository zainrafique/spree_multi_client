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
