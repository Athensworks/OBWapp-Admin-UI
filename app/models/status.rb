class Status < ActiveRecord::Base
  belongs_to :establishment
  belongs_to :beer

  
  scope :unknown, -> { where(status: status_options["Unknown"]) }
  scope :untapped, -> { where(status: status_options["Untapped"]) }
  scope :tapped, -> { where(status: status_options["Tapped"]) }
  scope :empty_reported, -> { where(status: status_options["Empty-Reported"]) }
  scope :empty, -> { where(status: status_options["Empty"]) }  
  scope :cancelled, -> { where(status: status_options["Cancelled"]) }
  
  def self.status_options
    STATUS_OPTIONS
  end
  
  def self.status_values
    status_options.invert
  end

  def status_string
    Status.status_values[status.to_s].downcase
  end
end