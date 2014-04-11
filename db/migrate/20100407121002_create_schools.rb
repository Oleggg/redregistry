class CreateSchools < ActiveRecord::Migration
  def self.up
    create_table :schools do |t|
      t.references :company, :null => false
      t.references :teen, :null => false
      t.date :date_from
      t.date :date_to
      t.timestamps
    end
  end

  def self.down
    drop_table :schools
  end
end

