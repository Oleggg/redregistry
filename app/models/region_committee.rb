class RegionCommittee < ActiveRecord::Base
  has_many :addresses, :as => :addressable, :dependent => :destroy
  #has_many :members

  accepts_nested_attributes_for :addresses

  #validates_presence_of :description
  
  scope :sorted, order("note")

end
