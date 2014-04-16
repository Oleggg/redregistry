class RemoveSubscribersUser < ActiveRecord::Migration
  def self.up
    change_table :subscribers do |t|
      t.remove :user_id
    end
  end

  def self.down
    change_table :subscribers do |t|
      t.belongs_to :user
    end
  end
end
