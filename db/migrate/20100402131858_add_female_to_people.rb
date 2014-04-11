class AddFemaleToPeople < ActiveRecord::Migration
  def self.up
    add_column :people, :gender, :integer, :null => false, :default => 0
  end

  def self.down
    remove_column :people, :gender
  end
end
