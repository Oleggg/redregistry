  task :upload_streets_penza => :environment do
    kladr = IO.readlines("#{Rails.root}/public/system/data/STREET_58.txt")
    socr = IO.readlines("#{Rails.root}/public/system/data/SOCRBASE.txt")

    socr.each_with_index do |s,i|
      st = s.split(";")
#     puts "#{i+1} LEVEL - #{st[0].delete("\"")} "
      level = case st[0].delete("\"")
        when '5' then
          puts " LEVEL - #{st[0].delete("\"")} NAME - #{st[1].delete("\"")}"
          kladr.each_with_index do |k,j|
            #puts "-----#{j+1} Uploading from level #{st[0].delete("\"")} ..."
            kt = k.split(";")
            unless kt[1].nil?
              if kt[1].delete("\"") == "арбан" 
                next
              end
              if kt[1].delete("\"") == "аул" 
                next
              end
              if kt[1].delete("\"") == "аал" 
                next
              end
              if kt[1].delete("\"") == "волость" 
                next
              end
              if kt[1].delete("\"") == "высел" 
                next
              end
            #if kt[1].delete("\"") == "городок" 
            #  next
            #end
              if kt[1].delete("\"") == "д" 
                next
              end
            end
            if kt[1].delete("\"") == st[1].delete("\"")
              puts "#{kt[1].delete("\"")}"
              puts "#{st[1].delete("\"")}"
              region_id = kt[2].delete("\"").slice!(0..1)
              if region_id == "58"
                puts "----------# Uploading #{kt[0]} - #{st[1]} ..."
                code = kt[2].delete("\"").slice!(0..14)
                Street.create(:name => "#{kt[1].delete("\"")}. " + "#{kt[0].delete("\"")}", :region_id => region_id, :district_id => kt[2].delete("\"").slice!(0..4), :city_id => kt[2].delete("\"").slice!(0..10), :town_id => kt[2].delete("\"").slice!(0..10), :code => code )
              end
            end
          end
      end
    end
  end
