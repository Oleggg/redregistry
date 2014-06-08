# == Schema Information
#
# Table name: districts
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)     not null
#  region_id  :integer(4)      not null
#  created_at :datetime
#  updated_at :datetime
#  code       :integer(4)      not null
#

class District < ActiveRecord::Base
  belongs_to :region, :foreign_key => "region_id", :primary_key => "code"

  has_many :houses
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
  scope :sorted, order("name")

  def self.for_select(options = {:include_blank => true})
    o = sorted.all.collect{|i| [i.name, i.code]}
    o = [['', nil]] + o if options[:include_blank]
    o
  end

end
