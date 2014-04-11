class CreateDepartments < ActiveRecord::Migration
  def self.up
    create_table :departments do |t|
      t.string :name, :null => false
      t.string :full_name, :limit => 500
      t.string :phone1
      t.string :phone2
      t.string :comment, :limit => 2000
      t.timestamps
    end

    add_index :departments, :name
    add_index :departments, :full_name
  end

  def self.down
    drop_table :departments
  end
end
