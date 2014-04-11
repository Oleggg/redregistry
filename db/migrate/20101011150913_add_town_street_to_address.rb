class AddTownStreetToAddress < ActiveRecord::Migration
  def self.up
    change_table :addresses do |t|
      t.references :town
      t.references :street
    end
  end

  def self.down
    change_table :addresses do |t|
      t.remove :town
      t.remove :street
    end
  end
end
