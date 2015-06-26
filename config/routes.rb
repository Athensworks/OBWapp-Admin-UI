Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  root "admin/dashboard#index"
end
