class AddCompanyToCards < ActiveRecord::Migration
  def self.up  
    change_table :cards do |t|
      t.integer :company_id
    end
  end

  def self.down  
    change_table :cards do |t|
      t.remove :company_id
    end
  end
end
