class RemoveDefaultTimestampValues < ActiveRecord::Migration
  def change
  	change_column_default :futuredata, :created_at, nil
  	change_column_default :futuredata, :updated_at, nil
  	change_column_default :likes, :created_at, nil
  	change_column_default :likes, :updated_at, nil
  end
end
