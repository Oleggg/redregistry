class CreateRegistrationCauses < ActiveRecord::Migration
  def self.up
    create_table :registration_causes do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :registration_causes
  end
end
