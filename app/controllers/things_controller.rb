class ThingsController < ApplicationController
  protect_from_forgery with: :null_session
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

  def get_api
    @thing = @project.things.find params[:id]
    render_json_thing
  end

  def post_api
    @thing = @project.things.find(obj_params[:name]) rescue @project.things.new(name: obj_params[:name])
    @thing.value = params.require(:thing)[:value].to_json

    if @thing.save
      render_json_thing
    else
      render json: @thing.errors.full_messages
    end
  end

  private

  def obj_params
    params.require(:thing).permit :name, :value
  end

  def set_project
    @project = Project.find params[:project_id]
  end

  def render_json_thing
    value = JSON.parse(@thing.value) rescue {}
    render json: value
  end
end
