class CreateFamilies < ActiveRecord::Migration
  def self.up
    create_table :families do |t|
      t.string :last_name, :null => false
      t.string :address, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :families
  end
end
