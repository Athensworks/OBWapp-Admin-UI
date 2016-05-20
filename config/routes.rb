Rails.application.routes.draw do

  post 'taste', to: "likes#taste"
  post 'favorite', to: "likes#favorite"
  post 'rate', to: "likes#rate"

  get 'breweries', to: "breweries#index"
  get 'beers', to: "beers#index"

  ActiveAdmin.routes(self)
end
