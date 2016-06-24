class LikesController < ApiController

  before_action :log_futuredata!

  def taste
    like_type   = Like::TASTE_VALUE
    device_guid = params[:device_guid]
    beer_id     = params[:beer_id]
    state       = params[:state]

    log_like_for(device_guid: device_guid, beer_id: beer_id, like_type: like_type, state: state)
    render_like_response_for(beer_id: beer_id, like_type: like_type)
  end

  def favorite
    like_type   = Like::FAVORITE_VALUE
    device_guid = params[:device_guid]
    beer_id     = params[:beer_id]
    state       = params[:state]

    log_like_for(device_guid: device_guid, beer_id: beer_id, like_type: like_type, state: state)
    render_like_response_for(beer_id: beer_id, like_type: like_type)
  end

  def rate
    device_guid = params[:device_guid]
    beer_id     = params[:beer_id]
    value       = params[:value]

    log_rating_for(device_guid: device_guid, beer_id: beer_id, value: value)
    render_rating_response_for(beer_id: beer_id)
  end

  private

  def log_futuredata!
    FutureData.log(params)
  end

  def log_like_for(device_guid:, beer_id:, like_type:, state:)
    finder_params = { device_guid: device_guid, beer_id: beer_id, like_type: like_type }
    if state == false
      Like.where(finder_params).delete_all
    else
      Like.find_or_create_by(finder_params.merge({state: state}))
    end
  end

  def log_rating_for(device_guid:, beer_id:, value:)
    rating = Rating.find_or_create_by(device_guid: device_guid, beer_id: beer_id)
    rating.update_attributes(value: value)
  end

  def like_count_for(beer_id:, like_type:)
    Like.where(beer_id: beer_id, like_type: like_type, state: true).count
  end

  def render_like_response_for(beer_id:, like_type:)
    render json: {
      beer_id: beer_id,
      count: like_count_for(beer_id: beer_id, like_type: like_type),
      like_type: like_type
    }
  end

  def render_rating_response_for(beer_id:)
    render json: {
      beer_id: beer_id,
      rating: Rating.where(beer_id: beer_id).average(:value)
    }
  end
end
