class CreateUnregistrationCauses < ActiveRecord::Migration
  def self.up
    create_table :unregistration_causes do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :unregistration_causes
  end
end
