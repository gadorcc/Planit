if @participant.persisted?
  json.form render(partial: "shared/add_friends_form", formats: :html, locals: {plan: @plan, participant: Participant.new})
  json.inserted_item render(partial: "plans/participant_status", formats: :html, locals: {participant: @participant})
else
  json.form render(partial: "shared/add_friends_form", formats: :html, locals: {plan: @plan, paticipant: @participant})
end
