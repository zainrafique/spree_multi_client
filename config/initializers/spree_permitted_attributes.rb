module Spree
  module PermittedAttributes
  
    @@user_attributes << :client_id
    @@product_attributes << :client_id
  end
end
