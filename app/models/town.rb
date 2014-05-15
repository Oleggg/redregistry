# == Schema Information
#
# Table name: towns
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)     not null
#  region_id   :integer(4)      not null
#  district_id :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#  code        :integer(8)
#

#require 'composite_primary_keys'
class Town < ActiveRecord::Base
# set_primary_key :code

  belongs_to :region, :primary_key => "code"
  belongs_to :district, :primary_key => "code"
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
    Town.where(:district_id => district_id ).all
  end


end
