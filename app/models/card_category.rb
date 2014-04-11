# == Schema Information
#
# Table name: card_categories
#
#  id          :integer(4)      not null, primary key
#  card_id     :integer(4)      not null
#  category_id :integer(4)      not null
#  comment     :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class CardCategory < ActiveRecord::Base
  belongs_to :card
  belongs_to :category

  validates_presence_of :card
  validates_presence_of :category

  def self.category_sb_count
    CardCategory.where(:category_id => 3 ).count
  end

  def self.category_vagrancy_count
    CardCategory.where(:category_id => 3 ).count
  end

  def self.category_danger_count
    CardCategory.where(:category_id => 4 ).count
  end

  def self.category_deviant_count
    CardCategory.where(:category_id => 5 ).count
  end
end

