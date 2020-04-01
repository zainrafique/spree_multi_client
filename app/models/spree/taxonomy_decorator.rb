Spree::Taxonomy.class_eval do
  
  clear_validators!
  
  # validates :name, presence: true, uniqueness: { case_sensitive: false, allow_blank: true, scope: :client_id }
  
  private

  def set_root
    self.root ||= Spree::Taxon.create!(taxonomy_id: id, name: name, client_id: client_id)
  end
end
