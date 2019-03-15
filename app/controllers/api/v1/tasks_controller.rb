class Api::V1::TasksController < ApplicationController
  def index
    user = User.find(session[:current_user_id])
    render :json => user.tasks
  end
  
  def create
    @task = Task.create(task_params)
    if @task
      render :json => @task
    else
      render :json => {'error': @task.errors.full_messages}
    end
  end
  
  def update
    @task = Task.find(params["id"])
    if @task.update_attributes(task_params)
      render :json => @task
    else
      render :json => {'error': @task.errors.full_messages} 
    end
  end
  
  def show
      if @task = Task.find(params[:id])
      render :json => @task
    else 
      render :json => {"errors": "We couldn't find your request"}
    end
  end
  
  def destroy
    Task.destroy(params[:id])
  end
  
  private
  
  def task_params
    params.require(:task).permit(:id, :content, :user_id, :project_id)
  end
end
