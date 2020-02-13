#for client add new role
Spree::Role.find_or_create_by(name: "client")


Spree::User.create(email: "spree@example.com", password: "spree123")
u = Spree::User.where(email: "client1@example.com").last
u1 = Spree::User.where(email: "client2@example.com").last
u2 = Spree::User.where(email: "client3@example.com").last
c = Spree::Client.create(name: "client1")
c2 = Spree::Client.create(name: "client2")
c3 = Spree::Client.create(name: "client3")

