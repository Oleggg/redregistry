# == Schema Information
#
# Table name: categories
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Category < ActiveRecord::Base
  has_many :card_categories
  validates_presence_of :name
  validates_uniqueness_of :name
  scope :sorted, order("name")

  def self.for_select(options = {:include_blank => false})
    o = sorted.all.collect{|i| [i.name, i.id]}
    o = [['', nil]] + o if options[:include_blank]
    o
  end

  def children_count
    CardCategory.where(:category_id => id).count
  end

  def child_count_period(from,to)
    c_category = CardCategory.joins(id)
#   category.where("category_id =? and registered_at >=? and registered_at <= ?",id,from,to).count
#   Category.all(:joins =>  'LEFT OUTER JOIN addresses ON addresses.client_id = clients.id')
#   CardCategory.all(:joins =>  'LEFT OUTER JOIN addresses ON addresses.client_id = clients.id')  
    result = c_category.joins(id)
#   result.where("registered_at >=? and registered_at <= ?",from,to).count
  #select *  
  #from password
  #left join user on user.id = password.userId
  #left join site on site.id = password.siteId
  #where user.id IS NOT NULL  and site.id is not null  
#  select COUNT(*)
#  from cards cd
#  left join card_category as cc
#  on (cc.category_id = cd.id)
#  left join cards 
#  on (cc.category_id = cd.id and cd.ragistered_at >= "2010-01-01")
###################################*****SQL*****################################################
#  select cd.id as card_id,cc.category_id as card_cat_id,cat.name,cd.registered_at from cards cd
#  inner join card_categories cc on (cd.id = cc.id)
#  inner join categories cat on (cat.id = cc.category_id)
#  /*where cat.name = "Безнадзорный"*/
#  where cat.id = 1
#  and (cd.registered_at >'2008-12-12' and cd.registered_at <'2010-08-12');
###############################################################################################
#  Card.find()
#  joins()
#  joins()
#  where(:category_id = :id).where(cd.registered_at >'2008-12-12' and cd.registered_at <'2010-08-12').count;
  end

  def children_count_period(from,to)
# Comment.all(:joins => { :user => :memberships}, :conditions => { :memberships => { :group_id => id } } )  
#  Card.find(:all).joins(:card_category).joins(:category).where(:category_id => 1).where("cd.registered_at >'2008-12-12' and cd.registered_at <'2010-08-12' ").count;
#   Category.joins(:card_categories => :card).where(:categories => {:name => "Безнадзорный"}).where( ['cards.id = ?','3'] )
    Category.joins(:card_categories => :card).where(:categories => {:id => id }).where( ["cards.registered_at >= ? and cards.registered_at <= ? ",from,to] ).count
  end
end

