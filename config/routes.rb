Onboard::Application.routes.draw do
  # set up the index, show, new, create, edit, update, destroy for rooms
  resources :rooms

  # what is the home page route
  root "rooms#index"
end
