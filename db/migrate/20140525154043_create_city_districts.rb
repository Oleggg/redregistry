class CreateCityDistricts < ActiveRecord::Migration
  def self.up
    create_table :city_districts do |t|
      t.string :name, :null => false
      t.references :city
      t.timestamps
    end
  end

  def self.down
    drop_table :city_districts
  end
end
