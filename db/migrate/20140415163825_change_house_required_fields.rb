class ChangeHouseRequiredFields < ActiveRecord::Migration
  def self.up
    change_column :houses, :storeys, :integer, :null => true
    change_column :houses, :porch_num, :integer, :null => true
    change_column :houses, :apartments_num, :integer, :null => true
    change_column :houses, :house_problems, :string, :null => true
  end

  def self.down
    change_column :houses, :storeys, :integer, :null => false
    change_column :houses, :porch_num, :integer, :null => false
    change_column :houses, :apartments_num, :integer, :null => false
    change_column :houses, :house_problems, :string, :null => false
  end
end
