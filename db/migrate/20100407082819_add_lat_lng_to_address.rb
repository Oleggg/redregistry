class AddLatLngToAddress < ActiveRecord::Migration
  def self.up
    add_column :addresses, :lat, :float, :default => 0.0
    add_column :addresses, :lng, :float, :default => 0.0
    add_column :addresses, :district, :string
  end

  def self.down
    remove_column :addresses, :lat
    remove_column :addresses, :lng
    remove_column :addresses, :district
  end
end

