class CreateDistricts < ActiveRecord::Migration
  def self.up
    create_table :districts do |t|
      t.string :name, :null => false
      t.references :region, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :districts
  end
end
