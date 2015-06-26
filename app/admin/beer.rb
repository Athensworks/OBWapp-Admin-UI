ActiveAdmin.register Beer do
  permit_params :name, :brewery, :ibu, :abv, :limited_release, :description, :rate_beer_id

  index do
    id_column
    column :name
    column :brewery
    column :ibu
    column :abv
    column :limited_release
    column :description
    column :rate_beer_id
    actions
  end

  form do |f|
    f.inputs "Beers" do 
      f.input :name
      f.input :brewery
      f.input :ibu
      f.input :abv
      f.input :limited_release
      f.input :description
      f.input :rate_beer_id
    end
    f.actions
  end

end
