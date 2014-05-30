class AddStreetToHouse < ActiveRecord::Migration
  def self.up
    change_table :houses do |t|
      t.references :street
    end
  end

  def self.down
    change_table :houses do |t|
      t.remove :street_id
    end
  end
end
