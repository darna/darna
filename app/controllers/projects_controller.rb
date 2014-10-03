class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.friendly.find params[:id]
  end

  def create
    @project = Project.new(obj_params)

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
