class Subscriber < ActiveRecord::Base
  belongs_to :person

  accepts_nested_attributes_for :person

  scope :sorted, order("subscription_reason")

  def self.subscribers_count
    #Person.where(:house_id => self.id, :is_subscriber => true).count
    #Person.where(:house_id => self.id).count
  end

end
