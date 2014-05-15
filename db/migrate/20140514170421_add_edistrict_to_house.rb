class AddEdistrictToHouse < ActiveRecord::Migration
  def self.up
    change_table :houses do |t|
      t.references :electoral_district, :null => true
    end
  end

  def self.down
    change_table :houses do |t|
      t.remove :electoral_district_id
    end
  end
end
