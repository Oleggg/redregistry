class CreateCardLocations < ActiveRecord::Migration
  def self.up
    create_table :card_locations do |t|
      t.references :card, :null => false
      t.references :location, :null => false
      t.date :entrance_date
      t.date :retirement_date
      t.string :comment
      t.timestamps
    end
  end

  def self.down
    drop_table :card_locations
  end
end
