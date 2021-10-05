class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.integer :distance
      t.integer :price
      t.integer :rider_id
      t.integer :driver_id
    end
  end
end
