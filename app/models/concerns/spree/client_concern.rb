module Spree
  module ClientConcern
    extend ActiveSupport::Concern

    included do
      belongs_to :client, class_name: 'Spree::Client'

      scope :with_client, ->(client_id) { where(client_id: client_id) }
    end
  end
end
