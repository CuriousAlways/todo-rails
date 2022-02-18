class SessionsController < ApplicationController
  skip_before_action :authenticate

  def new
  end

  def create 
    @user = User.find_by(email: params[:email])
    if @user.try(:authenticate, params[:password])
      session[:id] = @user.id
      redirect_to tasks_path, notice: 'logged in successfully'
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end
end
