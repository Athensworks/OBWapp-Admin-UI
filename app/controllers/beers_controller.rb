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
end
