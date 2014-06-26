class UsersController < ApplicationController
	def new
		@user = User.new
	end
	def create
		if user_exists(params[:user][:email])	 
		  flash[:user_exists] = "Username already exists, please register yourself with a different email."
	      redirect_to new_user_path
	    else
		# @user = User.new(params[:user])
		# @user.decks = Deck.all.dup #insert new deck, fixed name:japanese

		#######Fixed starting deck, and cards#####
		@user = User.new(params[:user])
		# @user.save
		@deck = Deck.new(name: "Japanese")
		# @deck.save
		@deck.user = @user
		@deck.save

		generate_fixed_cards(@deck) #application controllers inherited method
		
		sign_in(@user)#if user exists, it creates a user_id cookie for it

		redirect_to decks_path

		end
	end
end
