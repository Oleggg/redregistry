class CreateSubscribers < ActiveRecord::Migration
  def self.up
    create_table :subscribers do |t|
      t.date :subscription_date, :null => false
      t.date :unsubscription_date, :null => true
      t.boolean :is_subscribed, :null => false, :default => 1
      t.string :subscription_reason, :null => true
      t.integer :shipping_type
      t.belongs_to :user
      t.integer :total_subscribers
      t.timestamps
    end
  end

  def self.down
    drop_table :subscribers
  end
end
