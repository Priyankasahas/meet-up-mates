class Api::V1::EventsController < Api::BaseApiController
  def index
    events = Event.events_by_group(params[:group_id])
    if events
      render json: events, status: :ok
    else
      render nothing: true, status: :not_found
    end
  end
end
