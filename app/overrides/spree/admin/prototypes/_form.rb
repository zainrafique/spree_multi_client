Deface::Override.new(
		virtual_path: 'spree/admin/prototypes/_form',
		name: 'populate_properties_according_to_user_role',
		replace: 'div#properties',
		text: <<-HTML
					<div id="properties" data-hook>
						<% if defined?(current_spree_client) && current_spree_client %>
	            <%= f.field_container :property_ids, class: ['form-group'] do %>
					      <%= f.label :property_ids, Spree.t(:properties) %><br>
					      <%= f.collection_select(:property_ids, current_spree_client.properties, :id, :name_with_presentation, { }, { class: 'select2', multiple: true }) %>
					    <% end %>
						<% else %>
							<%= f.field_container :property_ids, class: ['form-group'] do %>
					      <%= f.label :property_ids, Spree.t(:properties) %><br>
								<%= f.collection_select(:property_ids, Spree::Property.all, :id, :name_with_presentation, { }, { class: 'select2', multiple: true }) %>
					    <% end %>
	          <% end %>
					</div>
HTML
)

Deface::Override.new(
		virtual_path: 'spree/admin/prototypes/_form',
		name: 'populate_option_types_according_to_user_role',
		replace: 'div#option_types',
		text: <<-HTML
					<div id="option_types" data-hook>
						<% if defined?(current_spree_client) && current_spree_client %>
							<%= f.field_container :option_type_ids, class: ['form-group'] do %>
	              <%= f.label :option_type_ids, Spree.t(:option_types) %>
	              <%= f.collection_select(:option_type_ids, current_spree_client.option_types, :id, :name_with_presentation, { }, { class: 'select2', multiple: true }) %>
	            <% end %>
						<% else %>
							<%= f.field_container :option_type_ids, class: ['form-group'] do %>
					      <%= f.label :option_type_ids, Spree.t(:option_types) %><br>
								<%= f.collection_select(:option_type_ids, Spree::OptionType.all, :id, :name_with_presentation, { }, { class: 'select2', multiple: true }) %>
					    <% end %>
	          <% end %>
					</div>
HTML
)

Deface::Override.new(
		virtual_path: 'spree/admin/prototypes/_form',
		name: 'populate_taxons_according_to_user_role',
		replace: 'div#taxons',
		text: <<-HTML
					<div id="taxons" data-hook>
						<% if defined?(current_spree_client) && current_spree_client %>
							<%= f.field_container :taxon_ids, class: ['form-group'] do %>
	              <%= f.label :taxon_ids, Spree.t(:taxons) %>
	              <%= f.collection_select(:taxon_ids, current_spree_client.taxons, :id, :name, { }, { class: 'select2', multiple: true }) %>
	            <% end %>
						<% else %>
							<%= f.field_container :taxon_ids, class: ['form-group'] do %>
					      <%= f.label :taxon_ids, Spree.t(:option_types) %><br>
								<%= f.collection_select(:taxon_ids, Spree::Taxon.all, :id, :name, { }, { class: 'select2', multiple: true }) %>
					    <% end %>
	          <% end %>
					</div>
HTML
)
