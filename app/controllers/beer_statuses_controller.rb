class BeerStatusesController < ApiController
  def index

    beer_statuses = Status.where(establishment_id: params[:establishment_id]).all.map do |status|
      {
       id: status.beer.id,
       status: status.status_string
      }
    end

    render json: { "beer_statuses" => beer_statuses }
  end
end
