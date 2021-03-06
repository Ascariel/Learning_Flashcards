Flashcards::Application.routes.draw do
   
  get "flatuipro_demo/index"

   resource :session, only: [:new, :create, :destroy] 
   resources :users
   resources :decks do   
    resources :cards, except: :index
  end

 
# Routes for decks/cards
   #    session  POST   /session(.:format)                       sessions#create
   # new_session GET    /session/new(.:format)                   sessions#new
   #             DELETE /session(.:format)                       sessions#destroy


#          users GET    /users(.:format)                         users#index
#                POST   /users(.:format)                         users#create
#       new_user GET    /users/new(.:format)                     users#new
#      edit_user GET    /users/:id/edit(.:format)                users#edit
#           user GET    /users/:id(.:format)                     users#show
#                PUT    /users/:id(.:format)                     users#update
#                DELETE /users/:id(.:format)                     users#destroy

#     deck_cards POST   /decks/:deck_id/cards(.:format)          cards#create
#  new_deck_card GET    /decks/:deck_id/cards/new(.:format)      cards#new
# edit_deck_card GET    /decks/:deck_id/cards/:id/edit(.:format) cards#edit
#      deck_card GET    /decks/:deck_id/cards/:id(.:format)      cards#show
#                PUT    /decks/:deck_id/cards/:id(.:format)      cards#update
#                DELETE /decks/:deck_id/cards/:id(.:format)      cards#destroy

#          decks GET    /decks(.:format)                         decks#index
#                POST   /decks(.:format)                         decks#create
#       new_deck GET    /decks/new(.:format)                     decks#new
#      edit_deck GET    /decks/:id/edit(.:format)                decks#edit
#           deck GET    /decks/:id(.:format)                     decks#show
#                PUT    /decks/:id(.:format)                     decks#update
#                DELETE /decks/:id(.:format)                     decks#destroy
#           root        /                                        decks#home                                      decks#home


  root :to => 'decks#home'

  # get "/decks" => "decks#index"
  # get "/decks/new" => "decks#new"
  # get "/decks/:id" => "decks#show", as: :deck
  # post "/decks" => "decks#create"
  # get "/decks/:id/edit" => "decks#edit"
  # put "/decks/:id" => "decks#update"
  # delete "/decks/:id" => "decks#destroy"

  
end

































# The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'