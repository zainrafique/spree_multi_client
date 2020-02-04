module Spree
  module Admin
    module ClientHelper
      def current_spree_client
        if current_spree_user.client.present?
          current_spree_user.client
        end
      end
    end
  end
end
