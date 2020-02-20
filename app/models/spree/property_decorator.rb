Spree::Property.class_eval do
  def name_with_presentation
    "#{self.presentation} (#{self.name})"
  end
end
