Creepiest::Application.routes.draw do
  root :to => "home#index"
  
  # Search
  post "search" => "accounts#search", :as => :search
  get "show/:id" => "accounts#show", :as => :show
  get "show/:id/locations.json" => "accounts#locations", :as => :locations
  
end
