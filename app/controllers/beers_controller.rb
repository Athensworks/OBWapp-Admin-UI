class StatusNotAcceptable < StandardError; end
class DeviceGuidAlreadyReported < StandardError; end

class BeersController < ApiController
  def index
    beers = Beer.includes(:tastes, :favorites, :brewery).map do |beer|
      {
       id: beer.id,
       name: beer.name,
       ibu: beer.ibu,
       abv: beer.abv,
       brewery: {
         id: beer.brewery.id,
         name: beer.brewery.name
       },
       description: beer.description,
       favorite_count: beer.favorites.count,
       taste_count: beer.tastes.count,
       limited_release: beer.limited_release,
      }
    end

    render json: beers
  end

  def update
    status = Status.find_by!(establishment_id: params[:establishment_id], beer_id: params[:beer_id])
    request_payload = JSON.parse request.body.read, symbolize_names: true

    raise StatusNotAcceptable unless request_payload[:status]
    raise DeviceGuidAlreadyReported unless ReportState.where(device_guid: request_payload[:device_guid], beer_id: params[:beer_id], establishment_id: params[:establishment_id]).count.zero?

    ReportState.create(device_guid: request_payload[:device_guid], beer_id: params[:beer_id], establishment_id: params[:establishment_id])
    status.last_out_update=Time.now
    status.reported_out_count += 1
    status.status = 4 if status.reported_out_count >= 3 # Empty-reported
    status.save

    render json: {status: status.status_string, reported_out_count: status.reported_out_count}

  rescue StatusNotAcceptable, DeviceGuidAlreadyReported, JSON::JSONError
    render json: {status: status.status_string, reported_out_count: status.reported_out_count}
  end
end
