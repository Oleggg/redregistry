class House < ActiveRecord::Base
  has_many :addresses, :as => :addressable, :dependent => :destroy

  accepts_nested_attributes_for :addresses

  validates_presence_of :description
  
  scope :sorted, order("description")


  def self.subscribers_count
    #Person.where(:house_id => self.id, :is_subscriber => true).count
    Person.where(:house_id => self.id).count
  end

end
