class CreateJoinTableTripsUsers < ActiveRecord::Migration[5.1]
  def change
    create_join_table :trips, :users do |t|
      # t.index [:trip_id, :user_id]
      # t.index [:user_id, :trip_id]
    end
  end
end
