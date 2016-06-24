class BeerStatusesController < ApiController
  def index
    beer_statuses = Status.all.map do |status|
      {
       id: status.id,
       status: status.status_string
      }
    end

    render json: beer_statuses
  end
end
