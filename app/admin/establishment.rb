ActiveAdmin.register Establishment do
  permit_params :name, :lat, :lon, :address
  active_admin_import validate: true

  show do
    attributes_table do
      row :name
      row :address
      row :lat
      row :lon
      row :map do |e|
        text_node google_map(e.lat, e.lon)
      end
    end
  end

  form do |f|
    f.inputs "Establishment" do
      f.input :name
      f.input :address
      f.input :lat
      f.input :lon
      f.input :description, input_html: { rows: 5 }
    end

    f.actions
  end

end
