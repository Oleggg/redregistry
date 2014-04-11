class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.string :name, :null => false
      t.string :full_name, :limit => 500
      t.string :phone1
      t.string :phone2
      t.string :comment, :limit => 2000
      t.references :company_type
      t.timestamps
    end

    add_index :companies, :name
    add_index :companies, :full_name
  end

  def self.down
    drop_table :companies
  end
end

