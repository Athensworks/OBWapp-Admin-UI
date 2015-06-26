ActiveAdmin.register Establishment do
  permit_params :name, :lat, :lon, :address

  show do      
    attributes_table do
      row :name
      row :lat
      row :lon
      row :address
      row :map do |e|
        text_node google_map(e.lat, e.lon)
      end
    end
  end
end
