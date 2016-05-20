class AddStateToLikes < ActiveRecord::Migration
  def change
    add_column :likes, :state, :bool, null: false, default: false
  end
end
