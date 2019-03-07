class Api::V1::UsersController < ApplicationController
  def index
    render :json => User.all
  end
  
  def create
    @user = User.new(users_params)
    if @user && @user.save
      session[:current_user_id] = @user.id
      render :json => @user
    else
      render :json => {"errors": @user.errors.full_messages}
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(users_params)
      render :json => @user
    else
      render :json => {"errors": @user.errors.full_messages}
    end
  end
  
  def show
    if @user = User.find(params[:id])
      render :json => @user
    else 
      render :json => {"errors": "We couldn't find your request"}
    end
  end
  
  def users_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
