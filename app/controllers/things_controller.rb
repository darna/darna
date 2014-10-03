class ThingsController < ApplicationController
  before_action :set_project

  def index
    @things = @project.things
  end

  def new
    @thing = @project.things.new
  end

  def show
    @thing = @project.things.find params[:id]
  end

  def create
    @thing = @project.things.new(obj_params)

    if @thing.save
      redirect_to project_things_path(@project)
    else
      render :new
    end
  end

  private

  def obj_params
    params.require(:thing).permit :name, :value
  end

  def set_project
    @project = Project.find params[:project_id]
  end
end
