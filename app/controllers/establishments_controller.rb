class EstablishmentsController < ApiController
  before_action :log_request

  def index
    establishments = Establishment.all.map do |establishment|
      {
       id: establishment.id,
       address: establishment.address,
       beer_statuses: establishment.statuses.map do |status|
          { id: status.id,
            status: status.status_string
          }
       end,
       lat: establishment.lat,
       lon: establishment.lon,
       name: establishment.name
      }
    end

    render json: establishments
  end

  private
    def log_request     
      FutureData.log params
    end

end
