class ParticipantsController < ApplicationController

  def create
    @plan = Plan.find(params[:plan_id])
    @participant = Participant.new
    @participant.plan = @plan
    user = User.find_by(nickname: params["participant"]["user"])
    @participant.user = user
    if @participant.save
      redirect_to plan_path(@plan)
    else
      redirect_to plan_path(@plan), status: :unprocessable_entity
    end
  end

  def update_status
    @participant = Participant.find(params[:id])
    if params[:status].present?
      if params[:status] == "Pending"
        @participant.update(status: "Going")
      elsif params[:status] == "Going"
        @participant.update(status: "NotGoing")
      elsif params[:status] == "NotGoing"
        @participant.update(status: "Maybe")
      else params[:status] == "Maybe"
        @participant.update(status: "Going")
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname)
  end
end
