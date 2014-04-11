class CreateStreets < ActiveRecord::Migration
  def self.up
    create_table :streets do |t|
      t.string :name, :null => false
      t.references :region, :null => false
      t.references :district
      t.references :city
      t.references :town
      t.timestamps
    end
    execute 'alter table streets add column code bigint unsigned'
  end

  def self.down
    drop_table :streets
  end
end
