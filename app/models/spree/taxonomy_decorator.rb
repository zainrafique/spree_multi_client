
Spree::Taxonomy.class_eval do
  private

  def set_root
    self.root ||= Spree::Taxon.create!(taxonomy_id: id, name: name, client_id: client_id)
  end
end
