Spree::Taxon.class_eval do
  
  before_save :set_client
  
  private
  
  def set_client
    self.client_id = taxonomy.client_id
  end
end
