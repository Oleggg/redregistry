class ModifyAddress < ActiveRecord::Migration
  def self.up
    change_table :addresses do |t|
      t.remove :country
      t.remove :region
      t.remove :district
      t.remove :city
      t.references :region
      t.references :district
      t.references :city
    end
  end

  def self.down
    change_table :addresses do |t|
      t.string :country
      t.string :region
      t.string :city
      t.string :district
      t.remove :region
      t.remove :district
      t.remove :city
    end
  end
end

