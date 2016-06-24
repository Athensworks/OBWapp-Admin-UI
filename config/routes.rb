Rails.application.routes.draw do

  post 'taste', to: "likes#taste"
  post 'favorite', to: "likes#favorite"
  post 'rate', to: "likes#rate"

  get 'breweries', to: "breweries#index"
  get 'beers', to: "beers#index"

  # TODO
  # get 'establishments' to: "establishments#index"
  # get '/establishment/:establishment_id/beer_statuses'
  # put '/establishment/:establishment_id/beer/:beer_id'

  root to: 'admin/dashboard#index'

  ActiveAdmin.routes(self)
end
