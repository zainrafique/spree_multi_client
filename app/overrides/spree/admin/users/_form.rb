Deface::Override.new(
    virtual_path: 'spree/admin/users/_form',
    name: 'show_roles_according_to_client',
    replace: 'div[data-hook="admin_user_form_roles"]',
    partial: "spree/admin/users/client_roles",
    )
