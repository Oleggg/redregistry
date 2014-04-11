# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

require 'rexml/document'
include REXML


Rails::Application.load_tasks


##  task :upload_cities do
##    puts "Hello World!"
#   require 'rubygems'
#   xml_data = YAML::load(open("#{RAILS_ROOT}/public/cladr.xml"))
##    xml_data = YAML::load(open("#{Rails.root}/public/system/data/cladr.xml"))
#    xml_data = YAML.load_file("#{RAILS_ROOT}/public/system/data/cladr.xml").read
##    doc = REXML::Document.new( xml_data )
#    puts "Loaded file!"
#    system "File opened"
##      puts "Loaded #{doc.to_s}!"
#    XPath.each("//KLADR") do |d|
##    doc.elements.each("//KLADR/NAME") do |d|
##      puts "Loaded #{d.text}!"
##    end
#    doc.xpath("//KLADR").each do |item|
#      puts "Loaded file!"
#      Product.create(:productname => product.css("name").text)
#    end


#    @doc.xpath("//product").each do |item|
#      Product.create(:productname => product.css("name").text)
#    end

#    system "svnversion > config/version.txt"
#    system "date +\"%Y-%m-%d %H:%M:%S\" >> config/version.txt"
#    system "svn ci config/version.txt -m \"deploy at #{Time.now.strftime("%F %T")}\""
##  end
