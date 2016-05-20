class AddTimestampsToLikes < ActiveRecord::Migration
  def change
    add_column :likes, :created_at, :datetime, null: false, default: Time.now
    add_column :likes, :updated_at, :datetime, null: false, default: Time.now
  end
end
