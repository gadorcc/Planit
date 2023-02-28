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
    # @plan.planner_id = current_user
    @plan.save!
    # redirect_to plan_path(@plan)

  end

  def edit
  end

  def show
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
    params.require(:plan).permit(:title, :location, :cost, :description)
  end
end
