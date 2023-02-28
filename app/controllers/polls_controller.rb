class PollsController < ApplicationController
  before_action :set_plan, only: %i[new create]
  def new
    @poll = Poll.new
  end

  def create
    @poll = Poll.new(polls_params)
    @poll.plan = @plan
    @poll.save
    # redirect_to plan_path(@plan)
  end

  private

  def set_plan
    @plan = Plan.find(params[:plan_id])
  end

  def polls_params
    params.require(:poll).permit(:question)
  end
end
