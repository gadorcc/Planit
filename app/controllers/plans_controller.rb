class PlansController < ApplicationController
  before_action :set_plan, only: %i[show edit update destroy]
  def index
    @plans = Plan.all
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    @plan.planner_id = current_user.id
    @plan.image = api_image
    @plan.save!
    redirect_to plan_path(@plan)

  end

  def edit
    # @participant = Participant.new
  end

  def show
      @users = User.all
      @participant = Participant.new
      @participants = Participant.all
    # @poll = Poll.new
    # @message = Message.new
    # @option = Option.new

  end

  def update
    @plan.update(plan_params)
    # redirect_to plan_path(@plan)
  end

  def destroy
    @plan.destroy
    redirect_to plans_path, status: :see_other
  end

  private

  def set_plan
    @plan = Plan.find(params[:id])
  end

  def plan_params
    params.require(:plan).permit(:title, :location, :cost, :description, :start_datetime, :end_datetime)
  end

  def user_params
    params.require(:user).permit(:nickname)
  end

  def api_image
    @client = Pexels::Client.new(ENV.fetch('PEXELS_API_KEY'))
    @photo = @client.photos.search("#{@plan.title}", per_page: 1).first
    # photo = @client.photos[@photo.id]
    @plan.image = @photo.url
  end
end
