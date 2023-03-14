class PlansController < ApplicationController
  before_action :set_plan, only: %i[show edit update destroy]
  def index
    # @plans = Plan.all
    @user = current_user
    @plans = Plan.order(start_datetime: :asc)
    @plans_active = @plans.where(start_datetime: (Time.now)..)
    @plans_planner = @plans_active.where(planner_id: current_user.id)
    @plans_participant = @plans_active.joins(:participants).where(participants: { user_id: current_user.id })
    @plans_active_all = @plans_planner && @plans_participant
    @plans_going_all = @plans_participant.joins(:participants).where(participants: { status: "Going" }) && @plans_planner
    @plans_participant_status = @plans_participant.joins(:participants).where.not(participants: { status: "Going" })
    @participant = Participant.all
    # @participant = Participant.find_by(user_id: current_user.id)
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    @plan.planner_id = current_user.id
    @plan.image = api_image
    @plan.save!
    sets_user_participant(@plan)
    redirect_to plan_path(@plan)
  end

  def edit
    # @participant = Participant.new
  end

  def show
    @users = User.all
    @participant = Participant.new
    @current_participant = Participant.find_by(user: current_user)
    @participants = @plan.participants
    @plans = @plan
    @markers =
      [{
        lat: @plan.latitude,
        lng: @plan.longitude
      },
       {
         lat: @plan.latitude,
         lng: @plan.longitude
       }]
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
    @plan.image = @photo.src["large"]
  end

  def sets_user_participant(plan)
    participant = Participant.new
    participant.user_id = current_user.id
    participant.plan_id = plan.id
    participant.status = "Going"
    participant.save!
  end
end
