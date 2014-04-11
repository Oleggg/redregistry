class AddCodeToCity < ActiveRecord::Migration
  def self.up
    change_table :cities do |t|
      t.integer :code, :null => false
    end
  end

  def self.down
    change_table :cities do |t|
      t.remove :code
    end
  end
end
