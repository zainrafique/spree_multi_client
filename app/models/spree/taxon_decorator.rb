Spree::Taxon.class_eval do
  
  clear_validators!

  validates :name, presence: true, uniqueness: { scope: [:parent_id, :taxonomy_id], allow_blank: true }
  validates :permalink, uniqueness: { case_sensitive: false, scope: :client_id }
  validates_associated :icon
  validate :check_for_root, on: :create
  with_options length: { maximum: 255 }, allow_blank: true do
    validates :meta_keywords
    validates :meta_description
    validates :meta_title
  end
  
  before_save :set_client
  
  private
  
  def set_client
    self.client_id = taxonomy.client_id
  end
end
