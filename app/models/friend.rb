# == Schema Information
#
# Table name: friends
#
#  id         :integer(4)      not null, primary key
#  person_id  :integer(4)      not null
#  friend_id  :integer(4)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Friend < ActiveRecord::Base
end
