class AddTimestampsToLikes < ActiveRecord::Migration
  def change
    add_column :likes, :created_at, :datetime, null: false
    add_column :likes, :updated_at, :datetime, null: false
  end
end
