class Api::V1::ProjectsController < ApplicationController
  def myprojects
    project1 = Project.where(owner_id: params[:id])
    project2 = Project.joins(:tasks).where(tasks: {user_id: params[:id]})
    @projects = (project1 + project2).uniq
    render :json => @projects, include: ['owner', 'tasks', 'tasks.user']
  end
  
  def create
    @project = Project.create(project_params)
    if @project
      task_params.each{|task| @project.tasks.create(task)}
      render :json => @project
    else
      render :json => {'error': @project.errors.full_messages}
    end
  end
  
  def update
    @project = Project.find(params["id"])
    if @project.update_attributes(project_params)
      @project.tasks.destroy_all
      task_params.each{|task| @project.tasks.create(task)}
      render :json => @project
    else
      render :json => {'error': @project.errors.full_messages} 
    end
  end
  
  def show
    render :json => Project.find(params[:id]), include: ['owner', 'tasks', 'tasks.user']
  end
  
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    render :json => @project
  end
  
  private
  
  def project_params
    params.require(:project).permit(:title, :description, :start_date, :end_date, :owner_id)
  end

  def task_params
    params.permit(tasks: [:content, :user_id]).to_h['tasks']
  end

end
