Onboard::Application.routes.draw do
  # set up the index, show, new, create, edit, update, destroy for rooms
  resources :rooms

  # lets have a signup section to our site
  resources :users

  # what is the home page route
  root "rooms#index"
end
