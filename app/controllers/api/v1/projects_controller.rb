class Api::V1::ProjectsController < ApplicationController
  def index
    # render :json => Project.find_by(owner_id: session[:current_user_id]), include: ['owner', 'tasks', 'tasks.user']
    render :json => Project.all, include: ['owner', 'tasks', 'tasks.user']
  end

  def myprojects
    project1 = Project.where(owner_id: params[:id])
    project2 = Project.joins(:tasks).where(tasks: {user_id: params[:id]})
    @projects = (project1 + project2).uniq
    render :json => @projects, include: ['owner', 'tasks', 'tasks.user']
  end
  
  def create
    @project = Project.create(project_params)
    if @project
      binding.pry
      task_params.each{|task| @project.tasks.create(task)}
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

  def task_params
    params.permit(tasks: [:content, :user_id]).to_h['tasks']
  end

end
