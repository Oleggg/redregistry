class AddCityDistrictToRegionCommittees < ActiveRecord::Migration
  def self.up
    change_table :region_committees do |t|
      t.references :city_district
    end
  end

  def self.down
    change_table :region_committees do |t|
      t.remove :city_district_id
    end
  end
end
