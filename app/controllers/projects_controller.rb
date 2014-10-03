class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = current_user.projects.all
  end

  def new
    @project = current_user.projects.new
  end

  def show
    @project = current_user.projects.friendly.find params[:id]
  end

  def create
    @project = current_user.projects.new(obj_params)

    if @project.save
      redirect_to projects_path
    else
      render :new
    end
  end

  private

  def obj_params
    params.require(:project).permit :name
  end
end
