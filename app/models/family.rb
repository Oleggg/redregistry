# == Schema Information
#
# Table name: families
#
#  id                  :integer(4)      not null, primary key
#  last_name           :string(255)     not null
#  address             :string(255)     not null
#  created_at          :datetime
#  updated_at          :datetime
#  family_structure_id :integer(4)
#

class Family < ActiveRecord::Base
  validates_presence_of :last_name
  validates_uniqueness_of :last_name, :scope => :address

  belongs_to :family_structure
# belongs_to :family_type
  has_many :family_family_types, :dependent => :destroy
  has_many :cards
#  has_many :family_types, :through => :family_family_type

  accepts_nested_attributes_for :family_family_types, :allow_destroy => true

  scope :sorted, order("last_name, address")

  def family_name
    "#{last_name} - #{address}"
  end

  def self.for_select
    Family.sorted.all.collect {|f| [f.family_name, f.id]}
  end

  def family_type_name
    family_type.name
  end

  def self.family_count_period(from,to)
    Family.where("created_at >=? and created_at <= ?",from,to).count
  end

  def self.cards_count
    Card.where(:family_id => id).count
  end

  def self.cards_healthy_count
    Family.joins(:cards).where(:cards => { :health_status => 1 }).count
  end

  def self.cards_disabled_count
    Family.joins(:cards).where(:cards => { :health_status => 2 }).count
  end

  def self.children_count
    Family.joins(:cards).count
  end

  def self.children_count_period(from,to)
    Family.joins(:cards).where("cards.created_at between ? and ?",from,to).count
  end

end

