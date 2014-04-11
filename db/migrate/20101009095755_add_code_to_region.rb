class AddCodeToRegion < ActiveRecord::Migration
  def self.up
    change_table :regions do |t|
      t.integer :code, :null => false
    end
  end

  def self.down
    change_table :regions do |t|
      t.remove :code
    end
  end
end
