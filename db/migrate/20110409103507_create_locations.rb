class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.integer :account_id, :null => false
      t.float :lat, :null => false
      t.float :lng, :null => false
      t.datetime :location_time, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :locations
  end
end
