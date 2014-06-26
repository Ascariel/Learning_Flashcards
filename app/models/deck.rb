class Deck < ActiveRecord::Base
	attr_accessible :name
	has_many :cards
	belongs_to :user
	# scope: :funcion, somefunction
end