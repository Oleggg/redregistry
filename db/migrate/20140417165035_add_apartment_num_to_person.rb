class AddApartmentNumToPerson < ActiveRecord::Migration
  def self.up
    change_table :people do |t|
      t.integer :apartment_num, :null => true
    end
  end

  def self.down
    change_table :people do |t|
      t.remove :apartment_num
    end
  end
end
