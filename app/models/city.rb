# == Schema Information
#
# Table name: cities
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)     not null
#  region_id   :integer(4)      not null
#  created_at  :datetime
#  updated_at  :datetime
#  district_id :integer(4)
#  code        :integer(8)
#

class City < ActiveRecord::Base
  belongs_to :region, :primary_key => "code"
  has_many :streets

  validates_presence_of :name
  validates_uniqueness_of :name
  
  scope :sorted, order("name")

  def self.for_select(options = {:include_blank => true})
    o = sorted.all.collect{|i| [i.name, i.code]}
    o = [['', nil]] + o if options[:include_blank]
    o
  end

  def self.for_select(district_id = nil)
    #[[' - не выбран - ', nil]] + find(:all, :conditions => {:district_id => district_id}).collect{|p| [p.name, p.id]}
    City.where(:district_id => district_id ).all
    #find(:all, :conditions => {:district_id => district_id}).collect{|i| [i.name, i.id]}
    #o = sorted.all.collect{|i| [i.name, i.code]}
    #o = [['', nil]] + o if options[:include_blank]
    #o
  end

end
