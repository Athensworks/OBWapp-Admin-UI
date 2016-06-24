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

    report_state_params = {device_guid: params[:device_guid], beer_id: params[:beer_id], establishment_id: params[:establishment_id]}
    raise StatusNotAcceptable unless params[:status].present?
    raise DeviceGuidAlreadyReported unless ReportState.where(report_state_params).count.zero?

    ReportState.create(report_state_params)

    update_reported_state!(status)

    render json: {status: status.status_string, reported_out_count: status.reported_out_count}

  rescue StatusNotAcceptable, DeviceGuidAlreadyReported, JSON::JSONError
    render json: {status: status.status_string, reported_out_count: status.reported_out_count}
  end

  private

  def update_report_state!(status)
    status.last_out_update     = Time.now
    status.reported_out_count += 1
    status.status              = STATUS_OPTIONS["Empty-Reported"] if status.reported_out_count >= 3
    status.save
  end
end
