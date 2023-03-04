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
      render "plans/show", status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname)
  end

end
