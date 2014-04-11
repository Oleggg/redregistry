class CreateInspectors < ActiveRecord::Migration
  def self.up
    create_table :inspectors do |t|
      t.references :person, :null => false
      t.references :teen, :null => false
      t.date :date_from
      t.date :date_to
      t.timestamps
    end
  end

  def self.down
    drop_table :inspectors
  end
end

