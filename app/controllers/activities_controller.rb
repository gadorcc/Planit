class ActivitiesController < ApplicationController
  before_action :set_plan, only: %i[new create]
  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activities_params)
    @activity.plan = @plan
    @activity.save
    # redirect_to plan_path(@plan)
  end

  private

  def set_plan
    @plan = Plan.find(params[:plan_id])
  end

  def activities_params
    params.require(:activity).permit(:start_datetime, :end_datetime, :location, :cost, :title)
  end
end
