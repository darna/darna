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
    @thing = @project.things.friendly.find params[:id]
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
    @thing = @project.things.friendly.find params[:id]
    value = JSON.parse(@thing.value) rescue {}
    render json: value
  end

  def post_api
    @thing = @project.things.where(name: obj_params[:name]).first_or_initialize
    @thing.value = params.require(:thing)[:value].to_json

    if @thing.save
      render json: @thing.to_json
    else
      render json: @thing.errors.full_messages
    end
  end

  private

  def obj_params
    params.require(:thing).permit :name, :value
  end

  def set_project
    @project = Project.friendly.find params[:project_id]
  end

end
