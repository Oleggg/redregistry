class Tic < ActiveRecord::Base
  has_many :addresses, :as => :addressable, :dependent => :destroy
  has_many :members

  accepts_nested_attributes_for :addresses

  scope :sorted, order("name")

  def self.for_select(options = {:include_blank => false})
    o = sorted.all.collect{|i| [i.name, i.id]}
    o = [['', nil]] + o if options[:include_blank]
    o
  end

end
