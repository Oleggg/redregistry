  task :upload_regions_test => :environment do
    xml_data = YAML::load(open("#{Rails.root}/public/system/data/CLADR_regions_Penza.xml"))
    doc = REXML::Document.new( xml_data )
    kl = doc.elements.to_a("//KLADR")
    kl.each_with_index do |k,i|
      puts "#{i+1} Uploading #{k.elements['NAME'].text} ..."
      status = case k.elements['SOCR'].text
           when "обл"  then  
             Region.create(:name => "#{k.elements['NAME'].text} " + "#{k.elements['SOCR'].text}", :id => k.elements['GNINMB'].text.to_i)
           when "Респ"  then  
             Region.create(:name => "#{k.elements['NAME'].text} " + "#{k.elements['SOCR'].text}", :id => k.elements['GNINMB'].text.to_i)
           when "округ"  then  
             Region.create(:name => "#{k.elements['NAME'].text} " + "#{k.elements['SOCR'].text}", :id => k.elements['GNINMB'].text.to_i)
           when "Аобл"  then  
             Region.create(:name => "#{k.elements['NAME'].text} " + "#{k.elements['SOCR'].text}", :id => k.elements['GNINMB'].text.to_i)
           when "АО"  then  
             Region.create(:name => "#{k.elements['NAME'].text} " + "#{k.elements['SOCR'].text}", :id => k.elements['GNINMB'].text.to_i)
           when "край"  then  
             Region.create(:name => "#{k.elements['NAME'].text} " + "#{k.elements['SOCR'].text}", :id => k.elements['GNINMB'].text.to_i)
      end
    end
  end
