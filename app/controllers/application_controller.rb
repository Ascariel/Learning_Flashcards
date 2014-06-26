class ApplicationController < ActionController::Base
  protect_from_forgery
  

  def current_user #by this I make this method available for all controllers throug inheritance, its faster tha typing it everytime for each.
  	if (cookies[:user_id])
  		user_id = cookies.signed[:user_id] #because cookie was stored in signed(encrypted) cookie jar. Returns nil if it doesnt exist
  		return User.find_by_id(user_id)
  	end
  end
  helper_method :current_user #when I declare :current_user as a helper method, I make this method available for all views througout my app

  def sign_in(user)#if user exists, it assigns cookie with user id, that enables to pass authenticate tests
    if user
  	cookies.signed[:user_id] = user.id
    else

    end
  end
  def authenticate
  	unless sign_in?
      flash[:failed_login] = " You must be logged in to access the app. Please check make sure you have an account with us and your login info is correct"
  		redirect_to new_session_path
  	end
  end
  def sign_in?
  	current_user #because if it doesnt exist will be nil, thanks to find_by_* method
  end
  helper_method :sign_in?

  def user_exists(user)
    User.find_by_email(user)
  end




 def generate_fixed_cards(deck) #Generates a set of fixed cards for a given deck, then saves them to db

  cards = [{:front=>"Cat", :back=>"Neko"}, {:front=>"Dog", :back=>"Inu"}, {:front=>"Horse", :back=>"Uma"}, {:front=>"Bird", :back=>"Tori"}, {:front=>"Fish", :back=>"Sakana"}, {:front=>"Bear", :back=>"Kuma"}, {:front=>"Dragon", :back=>"Ryuu"}, {:front=>"Octopus", :back=>"Tako"}, {:front=>"Rabbit", :back=>"Usagi"}]
  cards.each do |card|
    new_card = deck.cards.new(card)
    new_card.save
  end

 end




end
