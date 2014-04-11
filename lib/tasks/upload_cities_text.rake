  task :upload_cities_text => :environment do
    kladr = IO.readlines("#{Rails.root}/public/system/data/KLADR.txt")
#    kladr.each_with_index do |k,j|
#      kt = k.split(";")
#      puts "#{j} -- #{kt}"
#    end
#    kt = kladr.split(";")
    socr = IO.readlines("#{Rails.root}/public/system/data/SOCRBASE.txt")
#    puts "1 ------- #{socr[0]}"
#    IO.foreach("#{Rails.root}/public/system/data/SOCRBASE.txt", "") { |line| puts "#{line}" }

    socr.each_with_index do |s,i|
      st = s.split(";")
#     puts "#{i+1} LEVEL - #{st[0].delete("\"")} "
      level = case st[0].delete("\"")
        when '1' then
          puts " LEVEL - #{st[0].delete("\"")} NAME - #{st[1].delete("\"")}"
          kladr.each_with_index do |k,j|
            #puts "-----#{j+1} Uploading from level #{st[0].delete("\"")} ..."
            kt = k.split(";")
            if kt[1].delete("\"") == "г" 
              next
            end
            if kt[1].delete("\"") == st[1].delete("\"")
              puts "#{kt[1].delete("\"")}"
              puts "#{st[1].delete("\"")}"
              puts "----------# Uploading #{kt[0]} - #{st[1]} ..."
              Region.create(:name => "#{kt[0].delete("\"")} " + "#{kt[1].delete("\"")}")
            end
            #if j>100 
            #  break
            #end
          end
      end
    end
  end
