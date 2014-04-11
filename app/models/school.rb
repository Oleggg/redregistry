# == Schema Information
#
# Table name: schools
#
#  id         :integer(4)      not null, primary key
#  company_id :integer(4)      not null
#  teen_id    :integer(4)      not null
#  date_from  :date
#  date_to    :date
#  created_at :datetime
#  updated_at :datetime
#

class School < ActiveRecord::Base
end
