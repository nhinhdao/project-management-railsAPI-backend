class Api::V1::ProjectsController < ApplicationController
  def index
    render :json => Project.find_by(owner_id: session[:current_user_id]), include: ['owner', 'tasks', 'tasks.user']
    # render :json => Project.all
  end
  
  def create
    @project = Project.create(project_params)
    if @project
      render :json => @project
    else
      render :json => {'error': @project.errors.full_messages}
    end
  end
  
  def update
    project = project.find(params["id"])
    if project.update_attributes(project_params)
      render :json => @project
    else
      render :json => {'error': @project.errors.full_messages} 
    end
  end
  
  def show
    render :json => Project.find(params[:id]), include: ['owner', 'tasks', 'tasks.user']
  end
  
  def destroy
    Project.destroy(params[:id])
  end
  
  private
  
  def project_params
    params.require(:project).permit(:id, :name, :description, :start_date, :end_date, :status, :owner_id)
  end
end
