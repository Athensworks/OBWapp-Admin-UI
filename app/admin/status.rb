ActiveAdmin.register Status do
  permit_params :name, :lat, :lon, :address
  
end
