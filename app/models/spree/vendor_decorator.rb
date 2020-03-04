Spree::Vendor.class_eval do
  clear_validators!

  validates :name,
            presence: true,
            uniqueness: { case_sensitive: false, scope: :client_id },
            format: { with: /\A[A-Za-z0-9\ ]+\z/, message: Spree.t('only_alphanumeric_chars') }

  validates :slug, uniqueness: true
  
  if Spree.version.to_f >= 3.6
    validates_associated :image
  end

  validates :notification_email, email: true, allow_blank: true
	
end
