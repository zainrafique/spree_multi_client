Spree::Admin::BaseController.class_eval do
  include Spree::Admin::ClientHelper
  helper_method :current_spree_client
end
