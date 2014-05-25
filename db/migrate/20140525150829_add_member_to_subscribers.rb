class AddMemberToSubscribers < ActiveRecord::Migration
  def self.up
    change_table :subscribers do |t|
      t.references :member
    end
  end

  def self.down
    change_table :subscribers do |t|
      t.remove :member_id
    end
  end
end
