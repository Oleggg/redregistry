class CreateCardRegistrationCauses < ActiveRecord::Migration
  def self.up
    create_table :card_registration_causes do |t|
      t.references :card, :null => false
      t.references :registration_cause, :null => false
      t.string :comment
      t.timestamps
    end

    change_table :cards do |t|
      t.remove :registration_cause_id
    end
  end

  def self.down
    change_table :cards do |t|
      t.integer :registration_cause_id
    end

    drop_table :card_registration_causes
  end
end

