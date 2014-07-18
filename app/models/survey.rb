# == Schema Information
#
# Table name: surveys
#
#  id          :integer          not null, primary key
#  response    :integer
#  user_id     :integer
#  question_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Survey < ActiveRecord::Base

  belongs_to :user
  belongs_to :question

  validates_presence_of :response
  validates_presence_of :user_id
  validates_presence_of :question_id

end
