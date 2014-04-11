  task :upload_cladr_text => :environment do
    xml_data = YAML::load(open("#{Rails.root}/public/system/data/CLADR_test_Penza.xml"))
    doc = REXML::Document.new( xml_data )
    kladr = doc.elements.to_a("//KLADR")
    xml_data_SOCR = YAML::load(open("#{Rails.root}/public/system/data/SOCRBASE1.xml"))
    doc_socr = REXML::Document.new( xml_data_SOCR )
    socr = doc.elements.to_a("//SOCRBASE")
#    socr.each_with_index do |s,i|
#      level = case s.elements['LEVEL'].text
  end

