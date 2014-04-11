# == Schema Information
#
# Table name: eventlogs
#
#  id         :integer(4)      not null, primary key
#  event_type :integer(4)      not null
#  user_id    :integer(4)
#  data       :string(1000)
#  created_at :datetime
#

class Eventlog < ActiveRecord::Base
  EVENT_TYPES = {
    :user_login => 1,
    :user_logout => 2,
  }

  belongs_to :user
  validates_presence_of :event_type
  scope :sorted, includes(:user).order("created_at desc")

  def self.log(options = {})
    event_type = EVENT_TYPES[options[:event_type]]
    raise "Unknow event type" unless event_type

    # serialize event data to json string format
    data = options[:data].to_json

    Eventlog.create!(:event_type => event_type,
      :user_id => options[:user_id],
      :data => data)
  end

  def event_data
    # deserialize event data from json string format
    ActiveSupport::JSON.decode(data)
  rescue
    {}
  end

  def self.event_type_for_select(options = {:include_blank => false})
    o = Eventlog::EVENT_TYPES.collect{|k,v| [I18n::t("eventlog.#{k.to_s}"), v]}
    o = [['', nil]] + o if options[:include_blank]
    o
  end
end

