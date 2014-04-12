class CreateHouses < ActiveRecord::Migration
  def self.up
    create_table :houses do |t|
      t.text :description, :null => false
      t.integer :storeys, :null => false
      t.integer :porch_num, :null => false
      t.integer :apartments_num, :null => false
      t.string :house_problems, :null => false
    end
  end

  def self.down
    drop_table :houses
  end
end
