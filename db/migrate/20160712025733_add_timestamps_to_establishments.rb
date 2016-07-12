class AddTimestampsToEstablishments < ActiveRecord::Migration
  def change
    change_table :establishments do |t|
      t.timestamps
    end
  end
end
