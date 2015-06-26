ActiveAdmin.register Status do
  permit_params :establishment_id, :beer_id, :status
  
  actions :index, :show

  index do
    id_column
    column :establishment
    column :beer
    actions
  end
  
  form do |f|
      inputs 'Details' do
        input :establishment, :input_html => { :disabled => true }
        input :beer, :input_html => { :disabled => true }
        input :status, as: :radio, collection: STATUS_OPTIONS
        input :last_out_update, as: :string, :input_html => { :disabled => true }
        input :reported_out_count, :input_html => { :disabled => true }
      end

      actions
    end
end
