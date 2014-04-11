class CreateHealthStatuses < ActiveRecord::Migration
  def self.up
    create_table :health_statuses do |t|
      t.string :name, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :health_statuses
  end
end
