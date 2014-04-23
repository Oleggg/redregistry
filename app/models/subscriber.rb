class Subscriber < ActiveRecord::Base
  SHIPPING_TYPE = {:by_post => 1, :myself => 2}

  belongs_to :person

  accepts_nested_attributes_for :person

  scope :sorted, order("subscription_reason")

  def self.subscribers_count
    #Person.where(:house_id => self.id, :is_subscriber => true).count
    #Person.where(:house_id => self.id).count
  end

  def self.shipping_type_for_select
    [:by_post, :myself].collect {|s| [I18n.t("subscribers.shipping_type.#{s}"), SHIPPING_TYPE[s]] }
  end

  def shipping_type_for_display
    I18n.t("subscribers.shipping_type.#{SHIPPING_TYPE.index(self.shipping_type)}")
  end

end
