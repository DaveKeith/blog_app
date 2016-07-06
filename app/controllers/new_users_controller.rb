class NewUsersController < ApplicationController
  def new
    render "new_user/new_user_login.html.erb"
  end

  def create
    @user = User.new(user_params)
    # UserMailer.welcome_email(@user).deliver
    if @user.save
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to :root
      end
    else
      render :new
    end
  end

  private
  def user_params
    params.permit(:username, :email, :password, :confirmation)
  end
end
