class CreateTeachers < ActiveRecord::Migration
  def self.up
    create_table :teachers do |t|
      t.references :person, :null => false
      t.references :teen, :null => false
      t.references :school, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :teachers
  end
end

