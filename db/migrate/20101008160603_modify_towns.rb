class ModifyTowns < ActiveRecord::Migration
  def self.up
    drop_table :towns
    create_table :towns do |t|
      t.string :name, :null => false
      t.references :region, :null => false
      t.references :district
      t.timestamps
    end
  end

  def self.down
    drop_table :towns
  end
end
