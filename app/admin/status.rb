ActiveAdmin.register Status do
  permit_params :establishment_id, :beer_id, :status

  actions :all

  index do
    id_column
    column :establishment
    column :beer
    column :brewery do |s|
      s.beer.brewery.try(:name)
    end
    column :status do |s|
      status_tag Status.status_values[s.status.to_s]
    end
    column :last_out_update, sortable: true
    column :reported_out_count, sortable: true
    actions
  end

  form do |f|
    inputs 'Details' do
      input :establishment, :input_html => { :disabled => true }
      input :beer, :input_html => { :disabled => true }
      input :status, as: :radio, collection: Status.status_options
      input :last_out_update, as: :string, :input_html => { :disabled => true }
      input :reported_out_count, :input_html => { :disabled => true }
    end

    actions
  end

  scope :unknown
  scope :untapped
  scope :tapped
  scope :empty_reported
  scope :empty
  scope :cancelled


  controller do
    before_save do |status|
      status.last_out_update    = Time.now
      status.reported_out_count = 0

      ReportState.where(establishment_id: status.establishment_id, beer_id: status.beer_id).delete_all
    end
  end
end
