  task :upload_districts_penza => :environment do
    kladr = IO.readlines("#{Rails.root}/public/system/data/KLADR.txt")
    socr = IO.readlines("#{Rails.root}/public/system/data/SOCRBASE.txt")

    socr.each_with_index do |s,i|
      st = s.split(";")
#     puts "#{i+1} LEVEL - #{st[0].delete("\"")} "
      level = case st[0].delete("\"")
        when '2' then
          puts " LEVEL - #{st[0].delete("\"")} NAME - #{st[1].delete("\"")}"
          kladr.each_with_index do |k,j|
            #puts "-----#{j+1} Uploading from level #{st[0].delete("\"")} ..."
            kt = k.split(";")
            if kt[1].delete("\"") == "г" or kt[1].delete("\"") == "АО"
              next
            end
            if kt[1].delete("\"") == st[1].delete("\"")
              puts "#{kt[1].delete("\"")}"
              puts "#{st[1].delete("\"")}"
              #puts "----------# Uploading #{kt[0]} - #{st[1]} ..."
              #District.create(:name => "#{k.elements['NAME'].text} " + "#{k.elements['SOCR'].text}", :region_id => k.elements['CODE'].text.slice!(0..1))
              #region_id = kt[2].slice!(1..2)
              region_id = kt[2].delete("\"").slice!(0..1)
              if region_id == "58"
                puts "----------# Uploading #{kt[0]} - #{st[1]} ..."
                District.create(:name => "#{kt[0].delete("\"")} " + "#{kt[1].delete("\"")}", :region_id => "#{region_id}", :code => kt[2].delete("\"").slice!(0..4) )
              end
            end
            #if j>100 
            #  break
            #end
          end
      end
    end
  end
