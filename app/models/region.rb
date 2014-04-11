# == Schema Information
#
# Table name: regions
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)     not null
#  created_at :datetime
#  updated_at :datetime
#  code       :integer(4)      not null
#

class Region < ActiveRecord::Base
  has_many :cities
  has_many :districts

  validates_presence_of :name
  validates_uniqueness_of :name
  
  scope :sorted, order("name")

  def self.for_select(options = {:include_blank => false})
    o = sorted.all.collect{|i| [i.name, i.code]}
    o = [['', nil]] + o if options[:include_blank]
    o
  end

  def children_count
    Address.where(:region_id => id).count
  end
end
