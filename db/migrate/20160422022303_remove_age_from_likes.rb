class RemoveAgeFromLikes < ActiveRecord::Migration
  def change
    remove_column :likes, :age, :integer, limit: 2
  end
end
