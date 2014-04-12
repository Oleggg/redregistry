class House < ActiveRecord::Base
  has_many :addresses, :as => :addressable, :dependent => :destroy

  accepts_nested_attributes_for :addresses

  validates_presence_of :description
  
  scope :sorted

