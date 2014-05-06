# == Schema Information
#
# Table name: houses
#
#  id             :integer(4)      not null, primary key
#  description    :text            default(""), not null
#  storeys        :integer(4)
#  porch_num      :integer(4)
#  apartments_num :integer(4)
#  house_problems :string(255)
#  number         :integer(4)
#

class House < ActiveRecord::Base
  has_many :addresses, :as => :addressable, :dependent => :destroy
  has_many :tenants, :foreign_key => 'house_id', :class_name => "Person"

  accepts_nested_attributes_for :addresses

  validates_presence_of :description
  
  scope :sorted, order("description")

  def tenants_count
    tenants = self.tenants.count
  end

  def subscribers_count
    #Person.where(:house_id => self.id, :is_subscriber => true).count
    #Person.where(:house_id => self.id).count
    subscribers = Subscriber.joins(:person).where("people.house_id = #{self.id}").count
  end

  def subscribers
    subscribers = Subscriber.joins(:person)
    subscribers = subscribers.where("people.house_id = #{self.id}").all
  end

  def self.for_select(options = {:include_blank => false})
    o = sorted.all.collect{|i| [i.description, i.id]}
    o = [['', nil]] + o if options[:include_blank]
    o
  end

end
