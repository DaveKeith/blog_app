class NewUsersController < ApplicationController
  def create
    @user = User.new(user_params)
    # UserMailer.welcome_email(@user).deliver
    if @user.save
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to :root
      end
    else
      render "new_user/new_user_login.html.erb"
    end
  end

  def show
    @user = User.find(params["id"])
    render "profile/profile.html.erb"
  end

  def edit
    @user = User.find(params["id"])
    render "profile/edit_profile.html.erb"
  end

  def update
    right_now = DateTime.now
    @user = User.find(params["id"])
    @user.update(user_params)
    @user.updated_at = right_now
    redirect_to :root
  end

  private
  def user_params
    params.permit(:username, :email, :password, :confirmation)
  end
end
