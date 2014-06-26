class DecksController < ApplicationController
	before_filter :authenticate , except: :home #calls this method before doing any action
	def index
		@decks = current_user.decks # switched from @decks = Deck.all, so now it only displays the logged user decks.
	end

	def show
		@deck = find_deck # same as Deck.find(params[:id])
		@cards = @deck.cards
	end

	def new
		@deck = Deck.new
	end

	def create
		@deck = Deck.new(params[:deck])
		@deck.user = current_user
		@deck.save
		redirect_to decks_path
	end

	def edit
		@deck = find_deck
	end

	def update
		@deck = find_deck
		@deck.update_attributes(params[:deck])
		redirect_to decks_path
	end

	def destroy
		@deck = find_deck
		@deck.destroy
		redirect_to decks_path
	end

	def home
		if sign_in?
			redirect_to decks_path
		end
	end

	private

	def find_deck
		@deck = Deck.find(params[:id])
	end

end