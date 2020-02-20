Deface::Override.new(
		virtual_path: 'spree/admin/shipping_methods/_form',
		name: 'populate_shipping_categories_on_shipping_method_according_to_user_role',
		replace: 'div[data-hook="admin_shipping_method_form_availability_fields"]',
		text: <<-HTML
					<div data-hook="admin_shipping_method_form_availability_fields" class="col-12 col-lg-6">
						<div class="card mb-3 categories">
				      <div class="card-header">
				        <h1 class="card-title mb-0 h5">
				          <%= Spree.t(:shipping_categories) %>
				        </h1>
				      </div>
							<div class="card-body">
								<%= f.field_container :categories, class: ['form-group'] do %>
									<% if defined?(current_spree_client) && current_spree_client %>
										<% current_spree_client.shipping_categories.each do |category| %>
					            <div class="checkbox">
					              <%= label_tag do %>
					                <%= check_box_tag('shipping_method[shipping_categories][]', category.id, @shipping_method.shipping_categories.include?(category)) %>
					                <%= category.name %>
					              <% end %>
					            </div>
					          <% end %>
									<% else %>
										<% Spree::ShippingCategory.all.each do |category| %>
					            <div class="checkbox">
					              <%= label_tag do %>
					                <%= check_box_tag('shipping_method[shipping_categories][]', category.id, @shipping_method.shipping_categories.include?(category)) %>
					                <%= category.name %>
					              <% end %>
					            </div>
					          <% end %>
				          <% end %>
									<%= f.error_message_on :shipping_category_id %>
								<% end %>
							</div>
						</div>
						
					</div>
HTML
)

Deface::Override.new(
		virtual_path: 'spree/admin/shipping_methods/_form',
		name: 'populate_zones_on_shipping_method_according_to_user_role',
		replace: "erb[loud]:contains('Spree::Zone.all')",
		text: <<-HTML
					<% if defined?(current_spree_client) && current_spree_client %>
						<% current_spree_client.zones.each do |zone| %>
	            <div class="checkbox">
	              <%= label_tag do %>
	                <%= check_box_tag('shipping_method[zones][]', zone.id, shipping_method_zones.include?(zone)) %>
	                <%= zone.name %>
	              <% end %>
	            </div>
	          <% end %>
					<% else %>
						<% Spree::Zone.all.each do |zone| %>
	            <div class="checkbox">
	              <%= label_tag do %>
	                <%= check_box_tag('shipping_method[zones][]', zone.id, shipping_method_zones.include?(zone)) %>
	                <%= zone.name %>
	              <% end %>
	            </div>
	          <% end %>
          <% end %>
HTML
)

Deface::Override.new(
		virtual_path: 'spree/admin/shipping_methods/_form',
		name: 'populate_tax_categories_on_shipping_method_according_to_user_role',
		replace: "erb[loud]:contains('@tax_categories')",
		text: <<-HTML
					<% if defined?(current_spree_client) && current_spree_client %>
						<%= f.collection_select(:tax_category_id, current_spree_client.tax_categories, :id, :name, { include_blank: Spree.t('match_choices.none') }, { class: 'select2' }) %>
					<% else %>
						<%= f.collection_select(:tax_category_id, @tax_categories, :id, :name, { include_blank: Spree.t('match_choices.none') }, { class: 'select2' }) %>
          <% end %>
HTML
)
