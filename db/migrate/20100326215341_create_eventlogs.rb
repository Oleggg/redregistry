class CreateEventlogs < ActiveRecord::Migration
  def self.up
    create_table :eventlogs do |t|
      t.integer :event_type, :null => false
      t.references :user
      t.string :data, :limit => 1000
      t.datetime :created_at
    end
  end

  def self.down
    drop_table :eventlogs
  end
end

