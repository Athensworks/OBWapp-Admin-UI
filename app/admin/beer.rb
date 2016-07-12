ActiveAdmin.register Beer do
  active_admin_import validate: true

  config.sort_order = 'name_asc'

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
    column :rating do |b|
      Rating.for_beer(b)
    end
    column :limited_release
    column :description do |b|
      truncate(b.description, length: 50)
    end
    actions
  end

  show do
    panel 'Beer' do
      attributes_table_for beer do
        row :name
        row :brewery
        row :ibu
        row :abv
        row :rating do |b|
          Rating.for_beer(b)
        end
        row :untappd_url do |b|
          link_to b.untappd_url if b.untappd_url.present?
        end
        row :description
        row :limited_release
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
      f.input :untappd_url
      f.input :description, input_html: { rows: 5 }
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
