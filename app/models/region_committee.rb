# == Schema Information
#
# Table name: region_committees
#
#  id              :integer(4)      not null, primary key
#  first_secretary :string(255)     not null
#  note            :text
#  created_at      :datetime
#  updated_at      :datetime
#

class RegionCommittee < ActiveRecord::Base
  has_many :addresses, :as => :addressable, :dependent => :destroy
  has_many :members
  #has_many :houses
  belongs_to :district
  belongs_to :city_district

  accepts_nested_attributes_for :addresses

  #validates_presence_of :description
  
  scope :sorted, order("note")

  def self.for_select(options = {:include_blank => true})
    o = sorted.all.collect{|i| [ (i.addresses.first.full_address if i.addresses.first) , i.id]}
    o = [['', nil]] + o if options[:include_blank]
    o
  end

end
