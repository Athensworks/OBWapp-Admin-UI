class LikesController < ApiController

  before_action :log_futuredata!

  def taste
    like_type   = 1
    device_guid = params[:device_guid]
    beer_id     = params[:beer_id]
    state       = params[:state]

    log_like_for(device_guid: device_guid, beer_id: beer_id, like_type: like_type, state: state)
    render_like_response_for(beer_id: beer_id, like_type: like_type)
  end

  def favorite
    like_type   = 2
    device_guid = params[:device_guid]
    beer_id     = params[:beer_id]
    state       = params[:state]

    log_like_for(device_guid: device_guid, beer_id: beer_id, like_type: like_type, state: state)
    render_like_response_for(beer_id: beer_id, like_type: like_type)
  end

  def rate
  end

  private

  def log_futuredata!
    FutureData.create beer_id: params[:beer_id],
                      device_guid: params[:device_guid],
                      age: params[:age],
                      lat: params[:lat],
                      lon: params[:lon],
                      like_type: params[:like_type]
  end

  def log_like_for(device_guid:, beer_id:, like_type:, state:)
    Like.create(device_guid: device_guid, beer_id: beer_id, like_type: like_type, state: state)
  end

  def like_count_for(beer_id:, like_type:)
    true_counts  = Like.where(beer_id: beer_id, like_type: like_type, state: true).count
    false_counts = Like.where(beer_id: beer_id, like_type: like_type, state: false).count

    true_counts - false_counts
  end

  def render_like_response_for(beer_id:, like_type:)
    render json: {
      beer_id: beer_id,
      count: like_count_for(beer_id: beer_id, like_type: like_type),
      like_type: like_type
    }.to_json
  end
end
