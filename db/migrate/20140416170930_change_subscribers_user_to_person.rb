class ChangeSubscribersUserToPerson < ActiveRecord::Migration
  def self.up
    change_table :subscribers do |t|
      t.belongs_to :person
    end
  end

  def self.down
    change_table :subscribers do |t|
      t.belongs_to :user
    end
  end
end
