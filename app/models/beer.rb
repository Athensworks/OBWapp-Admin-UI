class Beer < ActiveRecord::Base
  has_many :statuses, dependent: :destroy
  has_many :establishments, through: :statuses
  has_many :favorites, -> { where(:like_type => 2) }, class_name: "Like"
  has_many :tastes, -> { where(:like_type => 1) }, class_name: "Like"

  belongs_to :brewery

  default_scope -> { order(:name) }

  def available_establishments
    establishments
  end

  def available_establishments=(establishment_ids)
    # Build new statuses
    establishment_ids.uniq.delete_if{|i| i.empty?}.each do |establishment_id|
      Status.find_or_create_by(establishment_id: establishment_id, beer_id: self.id) do |s|
        s.status = Status.status_options["Untapped"]
      end
    end

    # Remove un-needed statuses
    Status.where.not(establishment_id: establishment_ids.uniq.delete_if{|i| i.empty?}).where(beer_id: self.id).destroy_all
  end
end