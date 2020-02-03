#for client add new role
Spree::Role.find_or_create_by(name: "client")
