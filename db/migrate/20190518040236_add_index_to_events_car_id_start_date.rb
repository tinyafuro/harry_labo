class AddIndexToEventsCarIdStartDate < ActiveRecord::Migration[5.1]
  def change
    add_index :events, [:car_id, :start_date], unique: true
  end
end
