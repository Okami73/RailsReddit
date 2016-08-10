class UserController < ApplicationController
  def login
  	if session[:user]
  		redirect_to "/"
  	end
  end

  def register
  	if session[:user]
  		redirect_to "/"
  	end
  end

  def login_user
    user = User.find_by(username: params[:username])
    if(user)
      if(user.password == params[:password])
        session[:user] = user.id
        redirect_to "/"
      else
        flash[:errors] = []
        flash[:errors].push("Password is incorrect~")
        redirect_to :back
      end
    else
      flash[:errors] = []
      flash[:errors].push("Username doesn't exist")
      redirect_to :back
    end
  end

  def create_user
    @user = User.new(user_params)
    if @user.save
      session[:user] = @user.id
      redirect_to "/"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to :back
    end
  end

  def logout
    reset_session
    redirect_to "/login"
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
