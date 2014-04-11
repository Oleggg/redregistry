class CreateCompanyTypes < ActiveRecord::Migration
  def self.up
    create_table :company_types do |t|
      t.string :name, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :company_types
  end
end

