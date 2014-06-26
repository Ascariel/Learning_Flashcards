class CardsController < ApplicationController
	
	def show
		@deck = find_deck 		#should jus use find_deck method, like so: @deck = find_deck
		@card =  @deck.cards.find(params[:id])	#	
	end

	def edit
		@deck = find_deck
		@card = @deck.cards.find(params[:id])
		# @card = Card.find(params[:id])
		# @deck = @card.deck
	end

	def new
		@deck = find_deck 
		@card = @deck.cards.new #I USED CARD.NEW, PROBLEM IS THIS WAY THERES NO LINK BETWEEN CARD AND DECK.
		#WHY NOT JUST CARD.NEW, IN CREATE ACTION THE LINK IS RECREATED SO IT SHOULDNT BE NEEDED HERE....???
	end

	def create
		@deck = find_deck 
		@card = @deck.cards.new(params[:card]) #LINK IS CREATED AGAIN AND PARAMS ADDED, SEEMS LIKE WHAT WAS DONE FROM NEW ACTION IS LOST AND I START FROM SCRATCH
		@card.save
		redirect_to @deck
		#I USED FOLLOWING BAD CODE, BECAUSE I WAS MISSING LINK FROM CARD TO DECK, HAD TO IMPROVISE WITH ATTRIBUTE_UPDATE
		# @card_attr = params[:card].merge({deck_id: params[:deck_id]})
		# @card = Card.new(@card_attr)


	end

	def update
		@deck = find_deck 
		@card = Card.find(params[:id])
		@card_before_update = @card.dup
		@card.update_attributes(params[:card])
		@updated_status = true

	end

	def destroy
		@deck = find_deck 
		@card = Card.find(params[:id])
		@card.destroy
		@card.save
		redirect_to @deck
	end


	private 		#use private so rail nows this is not an action, just an specific method for this class only. Cant be accessed from outside
	def find_deck 
		Deck.find(params[:deck_id]) #replaces Deck.find(params[:deck_id]
		
	end

end
