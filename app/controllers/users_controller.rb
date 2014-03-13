class UsersController < ApplicationController

  # this controller is to be used for signup up new users

  def new
    # signup form
    @user = User.new
  end

  def create
  # actually create our new user
  @user = User.new(user_params)

    if @user.save
      flash[:success] = "You've signed up"

      # this is the user of the site let them store
      # which ID they are once they've signed up
      session[:uid] = @user.id
      redirect_to root_path
    else
      render 'new'
    end

  end

  def user_params
    # whitelist our form data
    params.require(:user).permit(:name, :username,
      :email, :password, :password_confirmation)
  end
end
