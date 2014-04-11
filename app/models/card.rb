# == Schema Information
#
# Table name: cards
#
#  id                      :integer(4)      not null, primary key
#  person_id               :integer(4)      not null
#  reg_num                 :string(255)
#  registered_at           :date
#  unregistered_at         :date
#  repeat                  :boolean(1)
#  comment                 :text
#  created_at              :datetime
#  updated_at              :datetime
#  registration_reason_id  :integer(4)
#  unregistration_cause_id :integer(4)
#  registration_address    :string(255)
#  accommodation_id        :integer(4)
#  address_comment         :text
#  employment_type_id      :integer(4)
#  status_comment          :text
#  family_id               :integer(4)
#  family_type_id          :integer(4)
#  family_structure_id     :integer(4)
#  special_signs           :text
#  health_status           :integer(4)
#  help_comment            :text
#  convicted_at            :date
#  released_at             :date
#  release_cause           :integer(4)
#  issued_by               :text
#  issued_at               :date
#  pension_cert_num        :string(255)
#  passport_serie          :integer(4)
#  passport_num            :string(255)
#  company_id              :integer(4)
#  is_archived             :boolean(1)
#

class Card < ActiveRecord::Base
  HEALTH_STATUS = {:almost_healthy => 1, :disabled => 2}
  RELEASE_CAUSE = {:udo => 1, :end_of_term => 2}

  acts_as_taggable_on :characteristics

  has_many :relatives, :dependent => :destroy
  has_many :card_categories, :dependent => :destroy
  has_many :card_registration_causes, :dependent => :destroy
  has_many :card_privacy_document_types, :dependent => :destroy
  has_many :card_child_helps, :dependent => :destroy
  has_many :card_family_helps, :dependent => :destroy
  has_many :card_locations, :dependent => :destroy
  has_many :registration_causes, :dependent => :destroy
  has_many :convictions, :dependent => :destroy
  has_many :card_child_characters, :dependent => :destroy
  has_many :card_doctors, :dependent => :destroy
  has_many :card_companies, :dependent => :destroy

  belongs_to :person
  belongs_to :registration_reason
  belongs_to :unregistration_cause
  belongs_to :accommodation
  belongs_to :employment_type
  belongs_to :family
  belongs_to :family_type
  belongs_to :family_structure
#  belongs_to :registration_cause

  accepts_nested_attributes_for :person
  accepts_nested_attributes_for :relatives, :allow_destroy => true
  accepts_nested_attributes_for :card_categories, :allow_destroy => true
  accepts_nested_attributes_for :card_registration_causes, :allow_destroy => true
  accepts_nested_attributes_for :card_privacy_document_types, :allow_destroy => true
  accepts_nested_attributes_for :card_child_helps, :allow_destroy => true
  accepts_nested_attributes_for :card_family_helps, :allow_destroy => true
  accepts_nested_attributes_for :card_locations, :allow_destroy => true
  accepts_nested_attributes_for :convictions, :allow_destroy => true
  accepts_nested_attributes_for :card_child_characters, :allow_destroy => true
  accepts_nested_attributes_for :card_doctors, :allow_destroy => true
  accepts_nested_attributes_for :card_companies, :allow_destroy => true

  accepts_nested_attributes_for :registration_causes, :allow_destroy => true

  validates_presence_of :person
  validates_uniqueness_of :person_id

  scope :sorted, joins(:person).order("people.last_name, people.first_name")

  def health_status_text
    I18n.t("cards.health_status.#{HEALTH_STATUS.index(health_status)}") if health_status
  end

  def self.health_status_for_select
    [:almost_healthy, :disabled].collect {|s| [I18n.t("cards.health_status.#{s}"), HEALTH_STATUS[s]] }
  end

  def release_cause_text
    I18n.t("cards.release_cause.#{RELEASE_CAUSE.index(release_cause)}") if health_status
  end

  def self.release_cause_for_select
    [:udo, :end_of_term].collect {|s| [I18n.t("cards.release_cause.#{s}"), RELEASE_CAUSE[s]] }
  end

  def health_status_children_count
    Card.where(:health_status => id).count
  end

  def health_status_families_count
    Card.where(:health_status => id).count("distinct family_id")
  end

  def self.children_healthy_count
    Card.where(:health_status => 1).count
  end

  def self.children_disabled_count
    Card.where(:health_status => 2).count
  end

  def registration_cause
    RegistrationCause.where(:card_id => id).joins(:card_registration_cause).all
  end

  def self.repeat_count
    Card.where(:repeat => 1 ).count
  end

  def self.repeat_count_period(from,to)
    Card.find_by_sql(["select * from cards c where c.repeat=1 and c.registered_at >= ? and c.registered_at <= ?",from,to]).count
#    Card.where("#{:repeat} = \"1\" and registered_at >=? and registered_at <= ?",from,to).count
  end

  def self.children_age_count(age_from,age_to)
    cards = Card.joins(:person) #"LEFT JOIN cards ON cards.person_id = id"
    cards = Card.joins(:person) #"LEFT JOIN cards ON cards.person_id = id"
#    @count = 0
#    cards.people.each do |p|
#      if p.age>age_from and p.age<age_to
#       @count+=1
#      end
#    end
     @cards = cards.where("YEAR(CURDATE())-YEAR(people.birthday)>=? AND YEAR(CURDATE())-YEAR(people.birthday)<=?", age_from, age_to).count
  end

  def self.children_age_count_period(age_from,age_to,d_from,d_to)
     cards = Card.joins(:person)
     @cards = cards.where("YEAR(CURDATE())-YEAR(people.birthday)>=? AND YEAR(CURDATE())-YEAR(people.birthday)<=? AND cards.registered_at between ? and ? ", age_from, age_to,d_from,d_to).count
#    Category.joins(:card_categories => :card).where(:categories => {:id => id }).where( ["cards.registered_at >= ? and cards.registered_at <= ? ",from,to] ).count
  end

  def self.not_archived_count
    Card.where("is_archived = false OR is_archived IS NULL").count
  end

  def self.archived_count
    Card.where(:is_archived => true ).count
  end
end

