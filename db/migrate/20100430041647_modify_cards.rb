class ModifyCards < ActiveRecord::Migration
  def self.up
    change_table :cards do |t|
      t.references :registration_reason
      t.references :registration_cause
      t.references :unregistration_cause
      t.string :registration_address
      t.references :accommodation
      t.text :address_comment
      t.references :employment_type
      t.text :status_comment
      t.references :family
      t.references :family_type
      t.references :family_structure
      t.text :special_signs
      t.integer :health_status
      t.text :help_comment
    end
  end

  def self.down
    change_table :cards do |t|
      t.remove :registration_reason_id, 
        :registration_cause_id, 
        :unregistration_cause_id,
        :registration_address,
        :accommodation_id,
        :address_comment,
        :employment_type,
        :status_comment,
        :family,
        :family_type,
        :family_structure,
        :special_signs,
        :health_status,
        :help_comment
    end
  end
end
