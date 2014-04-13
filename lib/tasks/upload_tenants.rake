  task :upload_tenants_penza => :environment do
    list = IO.readlines("#{Rails.root}/public/system/data/tenants.txt")

    list.each_with_index do |s,i|
      person = s.split(";")
      puts "----------# Uploading #{person[0]} - #{person[1]} ..."
      new_tenant = Person.create(:first_name => "#{person[0]}", :last_name => "#{person[1]}", :middle_name => "#{person[2]}", :birthday => "#{person[3]}")
      puts "----------# New tenant - #{new_tenant.id}"
      Address.create(:address_line => "#{person[4]}", :addressable_type => "Person", :addressable_id => "#{new_tenant.id}" )

    end
  end
