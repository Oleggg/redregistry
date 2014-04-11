class AddBigintCodesToStreet < ActiveRecord::Migration
  def self.up
    change_table :streets do |t|
      t.remove :city_id
      t.remove :town_id
    end
    execute 'alter table streets add column city_id bigint unsigned'
    execute 'alter table streets add column town_id bigint unsigned'
  end

  def self.down
  end
end
