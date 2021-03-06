class ThingsController < ApplicationController
  protect_from_forgery with: :null_session

  before_action :authenticate_user_from_token!, only: [:get_api, :post_api]
  before_action :authenticate_user!, except: [:get_api, :post_api, :ping]
  before_action :set_project, except: :ping

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

  def ping
    user = User.find_by_auth_token(params[:auth_token])
    render text: (user.nil? ? nil : 'pong')
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
    @project = current_user.projects.friendly.find params[:project_id]
  end

end
