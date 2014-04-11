# == Schema Information
#
# Table name: convictions
#
#  id            :integer(4)      not null, primary key
#  convicted_at  :date
#  term          :integer(4)
#  released_at   :date
#  comment       :text
#  created_at    :datetime
#  updated_at    :datetime
#  card_id       :integer(4)
#  release_cause :integer(4)
#  cc_article_id :integer(4)
#

class Conviction < ActiveRecord::Base
  belongs_to :card

  RELEASE_CAUSE = {:udo => 1, :end_of_term => 2}

  def release_cause_text
    I18n.t("convictions.release_cause.#{RELEASE_CAUSE.index(release_cause)}") if release_cause
  end

  def self.release_cause_for_select
    [:udo, :end_of_term].collect {|s| [I18n.t("convictions.release_cause.#{s}"), RELEASE_CAUSE[s]] }
  end

end
