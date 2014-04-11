class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :middle_name
      t.date :birthday
      t.string :birthplace
      t.string :mobile
      t.string :phone
      t.text :comment
      t.string :photo_file_name
      t.string :photo_content_type
      t.integer :photo_file_size
      t.datetime :photo_updated_at
      t.timestamps
    end
    add_index :people, [:last_name, :first_name, :middle_name]
  end

  def self.down
    drop_table :people
  end
end

