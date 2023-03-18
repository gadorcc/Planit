class ParticipantsController < ApplicationController

  def create
    @plan = Plan.find(params[:plan_id])
    @participant = Participant.new
    @participant.plan = @plan
    @user = User.find_by(nickname: params["participant"]["user"])
    if @user == current_user
      redirect_to plan_path(@plan), notice: "You are already going"
    else
      @participant.user = @user
      if @participant.save
        redirect_to plan_path(@plan)
      else
        redirect_to plan_path(@plan), status: :unprocessable_entity
      end
    end
  end

  def update
    @participant = Participant.find(params[:id])
    @participant.update(participant_params)

    redirect_to plan_path(@participant.plan)
  end

  private

  def user_params
    params.require(:user).permit(:nickname)
  end

  def participant_params
    params.require(:participant).permit(:status)
  end
end
