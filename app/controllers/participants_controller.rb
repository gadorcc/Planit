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

  def update
    @participant = Participant.find_by user_id: current_user.id
    @participant.user = current_user
    @participant.update!(participant_params)
    redirect_to plan_path(@participant.plan)

  end


  private


  def user_params		   def user_params
    params.require(:user).permit(:nickname)		     params.require(:user).permit(:nickname)
  end		   end

  def participant_params
    params.require(:participant).permit(:status)
  end
end
