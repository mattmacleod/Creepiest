Creepiest::Application.routes.draw do
  root :to => "home#index"
  
  # Search
  post "search" => "accounts#search", :as => :search
  get "show/:id" => "accounts#show", :as => :show
  
end
