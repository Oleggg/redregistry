class CreateTowns < ActiveRecord::Migration
  def self.up
    create_table :towns, :id => false do |t|
      t.string :code, :limit => 11, :null => false
      t.string :name, :null => false
      t.references :region, :null => false
      t.references :district
      t.timestamps
    end
#   execute "alter table towns modify column code primary key"
    add_index :towns, :code, :unique => true
  end

  def self.down
    drop_table :towns
  end
end
