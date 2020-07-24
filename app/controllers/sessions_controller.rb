class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    if login(email, password)
      flash[:success] = 'You have successfully logged in.'
      redirect_to @user
    else
      flash.now[:danger] = 'Login failed.'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'Logged out.'
    redirect_to root_url
  end
  
  private

  def login(email, password)
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      # ログイン成功
      session[:user_id] = @user.id
      return true
    else
      # ログイン失敗
      return false
    end
  end
  
end
