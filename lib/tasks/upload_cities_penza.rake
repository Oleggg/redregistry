  task :upload_cities_penza => :environment do
    kladr = IO.readlines("#{Rails.root}/public/system/data/KLADR.txt")
    socr = IO.readlines("#{Rails.root}/public/system/data/SOCRBASE.txt")

    socr.each_with_index do |s,i|
      st = s.split(";")
#     puts "#{i+1} LEVEL - #{st[0].delete("\"")} "
      level = case st[0].delete("\"")
        when '1' then
          puts " LEVEL - #{st[0].delete("\"")} NAME - #{st[1].delete("\"")}"
          kladr.each_with_index do |k,j|
            #puts "-----#{j+1} Uploading from level #{st[0].delete("\"")} ..."
            kt = k.split(";")
            #if kt[1].delete("\"") == "г" 
            #  next
            #end
            if kt[1].delete("\"") == st[1].delete("\"")
              region_id = kt[2].delete("\"").slice!(0..1)
              if region_id == "58"
                if kt[1].delete("\"") == "г" 
                  puts "#{kt[1].delete("\"")}"
                  puts "#{st[1].delete("\"")}"
                  puts "----------# Uploading #{kt[0]} - #{st[1]} ..."
                  puts "----------# District id #{kt[2].delete("\"").slice!(0..4)} ..."
                  puts "----------# Code #{kt[2].delete("\"").slice!(0..10)} ..."
                  code = kt[2].delete("\"").slice!(0..10)
                  puts "----------# Code #{code} ..."
                  City.create(:name => "#{kt[0].delete("\"")} ", :region_id => "#{region_id}", :code => "#{code}", :district_id => kt[2].delete("\"").slice!(0..4) )
                end
              end
            end
            #if j>100 
            #  break
            #end
          end
      end
    end
  end
