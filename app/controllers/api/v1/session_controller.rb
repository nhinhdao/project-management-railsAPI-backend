class Api::V1::SessionController < ApplicationController
  def create
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:current_user_id] = @user.id
      render :json => @user
    else
      render :json => {"errors": @user.errors.full_messages}
    end
  end
  
  def destroy
    session.destroy
    render :json => {'message': "Successfully Loged Out"}
  end
end
