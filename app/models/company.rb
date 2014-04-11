# == Schema Information
#
# Table name: companies
#
#  id              :integer(4)      not null, primary key
#  name            :string(255)     not null
#  full_name       :string(500)
#  phone1          :string(255)
#  phone2          :string(255)
#  comment         :string(2000)
#  company_type_id :integer(4)
#  created_at      :datetime
#  updated_at      :datetime
#

class Company < ActiveRecord::Base
  belongs_to :company_type
  has_many :addresses, :as => :addressable, :dependent => :destroy

  #has_many :card_companies, :dependent => :destroy

  accepts_nested_attributes_for :addresses

  validates_presence_of :name
  
  scope :sorted, order("name")

#  def self.for_select(options = {:include_blank => true})
#    o = sorted.all.collect{|i| [i.name, i.id]}
#    o = [['', nil]] + o if options[:include_blank]
#    o
#  end

  #def self.for_select
  #  Company.sorted.all.collect {|c| [c.name, c.id]}
  #end

  def self.for_select(options = {:include_blank => false})
    o = sorted.all.collect{|i| [i.name, i.id]}
    o = [['', nil]] + o if options[:include_blank]
    o
  end

end

