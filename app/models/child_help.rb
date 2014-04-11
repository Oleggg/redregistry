# == Schema Information
#
# Table name: child_helps
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class ChildHelp < ActiveRecord::Base
  has_many :card_child_helps
  validates_presence_of :name
  validates_uniqueness_of :name
  scope :sorted, order("name")

  def self.for_select(options = {:include_blank => false})
    o = sorted.all.collect{|i| [i.name, i.id]}
    o = [['', nil]] + o if options[:include_blank]
    o
  end

  def self.total_children_count
    ChildHelp.joins(:card_child_helps).count
  end

  def self.total_children_count_period(from,to)
    ChildHelp.joins(:card_child_helps).where( ["card_child_helps.help_date between ? and ? ",from,to] ).count
  end

  def children_count
    CardChildHelp.where(:child_help_id => id).count
  end

  def children_count_period(from,to)
    ChildHelp.joins(:card_child_helps => :card).where(:child_helps => {:id => id }).where( ["cards.registered_at >= ? and cards.registered_at <= ? ",from,to] ).count
  end
end
