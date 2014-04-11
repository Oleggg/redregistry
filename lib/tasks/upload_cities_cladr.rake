  task :upload_cities do
    xml_data = YAML::load(open("#{Rails.root}/public/system/data/cladr.xml"))
    doc = REXML::Document.new( xml_data )
    kl = doc.elements.to_a("//KLADR")
    kl.each do |k|
      puts k.elements['NAME'].text	
      puts k.elements['SOCR'].text
    end

#    doc.elements.each("//KLADR").to_a do |d|
#       puts "Loaded #{d.text}!"
#      puts "Loaded #{d}"
#      puts "Loaded #{d.node['id']}!" 
#      d.elements.each { |child| # Do something with child 
#        puts "Loaded #{child}!" 
#      }
#    end
#    @doc.xpath("//product").each do |item|
#      Product.create(:productname => product.css("name").text)
#    end

#    system "svnversion > config/version.txt"
#    system "date +\"%Y-%m-%d %H:%M:%S\" >> config/version.txt"
#    system "svn ci config/version.txt -m \"deploy at #{Time.now.strftime("%F %T")}\""
  end

  task :upload_cities_test => :environment do
    xml_data = YAML::load(open("#{Rails.root}/public/system/data/cladr.xml"))
    doc = REXML::Document.new( xml_data )
    kl = doc.elements.to_a("//KLADR")
    kl.each_with_index do |k,i|
      puts "#{i+1} Uploading #{k.elements['NAME'].text} ..."
      status = case k.elements['SOCR'].text	
           when "г"  then  
 #           City.create(:name => k.elements['NAME'].text, :region_id => k.elements['GNINMB'].text)
             City.create(:name => k.elements['NAME'].text,:district_id => k.elements['CODE'].text.slice!(0..4), :region_id => k.elements['CODE'].text.slice!(0..1))
#           when "р-н"  then  
#             if k.elements['GNINMB'].text.slice!(0..1) == "58"
#               District.create(:name => k.elements['NAME'].text, :region_id => k.elements['GNINMB'].text.slice!(0..1))
#             end
           when "д"  then  
             Region.create(:name => "#{k.elements['NAME'].text} " + "#{k.elements['SOCR'].text}", :id => k.elements['GNINMB'].text.to_i)
           when "с"  then  
             Region.create(:name => "#{k.elements['NAME'].text} " + "#{k.elements['SOCR'].text}", :id => k.elements['GNINMB'].text.to_i)
           when "дп"  then  
             Region.create(:name => "#{k.elements['NAME'].text} " + "#{k.elements['SOCR'].text}", :id => k.elements['GNINMB'].text.to_i)
           when "пгт"  then  
             Region.create(:name => "#{k.elements['NAME'].text} " + "#{k.elements['SOCR'].text}", :id => k.elements['GNINMB'].text.to_i)
           when "п"  then  
             Region.create(:name => "#{k.elements['NAME'].text} " + "#{k.elements['SOCR'].text}", :id => k.elements['GNINMB'].text.to_i)
           when "нп"  then  
             Region.create(:name => "#{k.elements['NAME'].text} " + "#{k.elements['SOCR'].text}", :id => k.elements['GNINMB'].text.to_i)



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
