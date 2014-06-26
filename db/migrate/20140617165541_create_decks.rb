class CreateDecks < ActiveRecord::Migration
 
 def change
  	  create_table :decks do |table|
  		table.string :name
  		table.timestamps
  	end
  end
end

  # def up # ActiveRecord::Migration knows how to undo some methods, so I can skip the up and down and just replace by change.
  # 	create_table :decks do |table|
  # 		table.string :name
  # 		# table.datetime :created_at #updated automatically by rails when theres any change
  # 		# table.datetime :updated_at #replaced by table.timestamps
  # 		table.timestamps
  # 	end

  # end

  # def down
  # 	drop_table :decks

 

