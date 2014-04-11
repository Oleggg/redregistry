# == Schema Information
#
# Table name: cc_articles
#
#  id         :integer(4)      not null, primary key
#  number     :string(255)     not null
#  name       :string(255)     not null
#  created_at :datetime
#  updated_at :datetime
#

class CcArticle < ActiveRecord::Base
  validates_presence_of :number
  validates_uniqueness_of :name

  has_many :convictions

  scope :sorted, order("number")

  def self.for_select(options = {:include_blank => true})
    o = sorted.all.collect{|i| [i.full_name, i.id]}
    o = [['', nil]] + o if options[:include_blank]
    o
  end

  def full_name
    "#{number}. #{name}"
  end

  def cards_count
    #CcArticle.joins(:convictions => :card).where(:cc_articles => { :id => id } ).count
    Conviction.joins(:card).where(:cc_article_id  => id ).find(:all,:select => "DISTINCT card_id").count
  end

  def self.all_cards_count
    #CcArticle.joins(:convictions => :card).count
    Conviction.joins(:card).find(:all,:select => "DISTINCT card_id").count
  end

end
