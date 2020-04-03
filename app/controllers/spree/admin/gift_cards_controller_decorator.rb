Spree::Admin::GiftCardsController.class_eval do
	
	def gift_card_params
		params.require(:gift_card).permit(:email, :name, :note, :value, :variant_id, :enabled, :client_id)
	end

end
