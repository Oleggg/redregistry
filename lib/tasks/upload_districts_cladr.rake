  task :upload_districts_test => :environment do
    xml_data = YAML::load(open("#{Rails.root}/public/system/data/CLADR_regions_Penza.xml"))
    doc = REXML::Document.new( xml_data )
    kl = doc.elements.to_a("//KLADR")
    kl.each_with_index do |k,i|
      puts "#{i+1} Uploading #{k.elements['NAME'].text} ..."
      status = case k.elements['SOCR'].text
           when "р-н"  then  
             if k.elements['GNINMB'].text.slice!(0..1) == "58"
#               District.create(:name => k.elements['NAME'].text, :region_id => k.elements['GNINMB'].text.slice!(0..1))
               District.create(:id => k.elements['CODE'].text.slice!(0..4),:name => k.elements['NAME'].text, :region_id => k.elements['CODE'].text.slice!(0..1))
             end
      end
     end
  end
