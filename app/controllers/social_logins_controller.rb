class SocialLoginsController < ApplicationController

  def create
    # instructions ...
    # get the social login details from the provider
    # check to see if they match any of the user in our database
    # if they are in there sign me in
    # if they are not in there
    # sign me up as a new user using the social login details

    @details = request.env["omniauth.auth"]

    @provider = @details["provider"]
    @provider_id = @details["uid"]

    @user = User.where(provider: @provider, provider_id: @provider_id).first

    if @user.present?
      # sign them in

    else
      # make a new user
      @user = User.new
      @user.provider = @provider
      @user.provider_id = @provider_id

      # because of has secure_password
      @user.password = "!!!!@@@@££££"
      @user.password_confirmation = "!!!!@@@@££££"

      # lets save the key and secret
      @user.key = @details["credentials"]["token"]
      @user.secret = @details["credentials"]["secret"]

      # lets fill in their details
      @user.name = @details["info"]["name"]
      @user.email = @details["info"]["email"]

      @user.save!


    end

    session[:uid] = @user.id
    flash[:success] = "You've logged in"
    redirect_to root_path
  end
end
