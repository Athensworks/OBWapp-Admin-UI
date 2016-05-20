class BreweriesController < ApiController
  def index
    breweries = Brewery.all.map do |brewery|
      {
       id: brewery.id,
       name: brewery.name,
       beers: brewery.beers.map do |beer|
         {
           id: beer.id,
           name: beer.name
         }
       end
      }
    end

    render json: breweries
  end
end


