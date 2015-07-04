ActiveAdmin.register Beer do
  controller do
    def permitted_params
      params.permit!
    end
  end

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

  show do
    panel 'Beer' do
      attributes_table_for beer do
        row :name
        row :brewery
        row :ibu
        row :abv
        row :limited_release
        row :rate_beer_id
      end
    end
    
    panel 'Available Establishments' do
      attributes_table_for beer do        
        beer.statuses.each do |s|
          row s.establishment.name do
            link_to(Status.status_values[s.status.to_s], edit_admin_status_path(s), class: "status_tag #{Status.status_values[s.status.to_s].downcase}")
          end
        end
      end
    end
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
    
    if beer.persisted?
      f.inputs 'Available Establishments' do
        f.input :available_establishments, as: :check_boxes, label: 'Serving Establishments', collection: Establishment.all
      end
    end

    f.actions
  end

  action_item :new, only: [:show, :edit] do
    link_to "New Beer", new_admin_beer_path
  end

end
