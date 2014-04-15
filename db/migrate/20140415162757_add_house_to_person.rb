class AddHouseToPerson < ActiveRecord::Migration
  def self.up
    change_table :people do |t|
      t.references :house, :null => true
    end
  end

  def self.down
    change_table :people do |t|
      t.remove :house_id
    end
  end
end
