Onboard::Application.routes.draw do

  # this could be a static about page
  # get "about" => "contents#about"

  get "auth/:provider/callback" => "social_logins#create"


  # set up the index, show, new, create, edit, update, destroy for rooms
  # path: "places"
  resources :rooms do
    # because I'm placing orders on to rooms
    # this is a nested resource
    resources :orders, only: [:new, :create]
  end

  # another section to my site, that is the index and show order pages
  # new and create are in the nested resource above as they rely on 
  # the room
  resources :orders, only: [:index, :show]

  # lets have a signup section to our site
  resources :users

  # lets have a log in and log out section to our site
  # this is called a sigular resource because as a user
  # we only ever are logged in once NOT multiple times
  resource :session



  # what is the home page route
  root "rooms#index"
end
