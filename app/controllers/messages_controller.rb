class MessagesController < ApplicationController
  before_action :set_plan, only: %i[new create]
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(messages_params)
    @message.plan = @plan
    @message.save
    # redirect_to plan_path(@plan)
  end

  private

  def set_plan
    @plan = Plan.find(params[:plan_id])
  end

  def messages_params
    params.require(:message).permit(:content)
  end
end
