Onboard::Application.routes.draw do
  # set up the index, show, new, create, edit, update, destroy for rooms
  resources :rooms

  # lets have a signup section to our site
  resources :users

  # lets have a log in and log out section to our site
  # this is called a sigular resource because as a user
  # we only ever are logged in once NOT multiple times
  resource :session

  # what is the home page route
  root "rooms#index"
end
