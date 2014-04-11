class CreateFriends < ActiveRecord::Migration
  def self.up
    create_table :friends do |t|
      t.integer :person_id, :null => false
      t.integer :friend_id, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :friends
  end
end

