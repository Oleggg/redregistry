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

  accepts_nested_attributes_for :addresses

  #validates_presence_of :description
  
  scope :sorted, order("note")

end
