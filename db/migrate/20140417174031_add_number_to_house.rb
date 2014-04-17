class AddNumberToHouse < ActiveRecord::Migration
  def self.up
    change_table :houses do |t|
      t.integer :number
    end
  end

  def self.down
    change_table :houses do |t|
      t.remove :number
    end
  end
end
