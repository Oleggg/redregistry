  task :upload_cladr_test => :environment do
    xml_data = YAML::load(open("#{Rails.root}/public/system/data/CLADR_test_Penza.xml"))
    doc = REXML::Document.new( xml_data )
    kladr = doc.elements.to_a("//KLADR")
    xml_data_SOCR = YAML::load(open("#{Rails.root}/public/system/data/SOCRBASE1.xml"))
    doc_socr = REXML::Document.new( xml_data_SOCR )
    socr = doc_socr.elements.to_a("//SOCRBASE")
    socr.each_with_index do |s,i|
      puts "#{i+1} LEVEL - #{s.elements['LEVEL'].text} "
      level = case s.elements['LEVEL'].text
        when '1' then
          kladr.each_with_index do |k,j|
            puts "-----#{j+1} Uploading from level #{s.elements['LEVEL'].text} ..."
            if k.elements['SOCR'].text == s.elements['SCNAME'].text 
              puts "----------# Uploading #{k.elements['NAME'].text} - #{s.elements['SCNAME'].text} ..."
              #Region.create(:name => "#{k.elements['NAME'].text} " + "#{k.elements['SOCR'].text}", :id => k.elements['GNINMB'].text.to_i)
              Region.create(:name => "#{k.elements['NAME'].text} " + "#{k.elements['SOCR'].text}")
            end
          end
#       end
#        when '2' then
#          kladr.each_with_index do |k,j|
#            puts "-----#{j+1} Uploading from level #{s.elements['LEVEL'].text} ..."
#            if k.elements['SOCR'].text == s.elements['SCNAME'].text
#              puts "----------# Uploading #{k.elements['NAME'].text} - #{s.elements['SOCR'].text} ..."
#              #District.create(:name => "#{k.elements['NAME'].text} " + "#{k.elements['SOCR'].text}", :id => k.elements['GNINMB'].text.to_i)
#              District.create(:name => "#{k.elements['NAME'].text} " + "#{k.elements['SOCR'].text}", :region_id => k.elements['CODE'].text.slice!(0..1))
#            end
#          end
##       end
#        when '3' then
#          kladr.each_with_index do |k,j|
#            puts "-----#{j+1} Uploading from level #{s.elements['LEVEL'].text} ..."
#            if k.elements['SOCR'].text == s.elements['SCNAME'].text
#              puts "----------# Uploading #{k.elements['NAME'].text} - #{s.elements['SOCR'].text} ..."
#              #City.create(:name => "#{k.elements['NAME'].text} " + "#{k.elements['SOCR'].text}", :id => k.elements['GNINMB'].text.to_i)
#              City.create(:name => "#{k.elements['NAME'].text} " + "#{k.elements['SOCR'].text}", :region_id => k.elements['CODE'].text.slice!(0..4) )
#            end
#          end
##       end
        when '4' then
          kladr.each_with_index do |k,j|
            puts "-----#{j+1} Uploading from level #{s.elements['LEVEL'].text} ..."
            if k.elements['SOCR'].text == s.elements['SCNAME'].text
              puts "----------# Uploading #{k.elements['NAME'].text} - #{s.elements['SOCR'].text} ..."
              #Town.create(:name => "#{k.elements['NAME'].text} " + "#{k.elements['SOCR'].text}", :id => k.elements['B'].text.to_i)
              Town.create(:name => "#{k.elements['NAME'].text} " + "#{k.elements['SOCR'].text}", :region_id => k.elements['CODE'].text.slice!(0..1), :district_id => k.elements['CODE'].text.slice!(0..4) )
            end
         end
#       end
     end
     end
  end
