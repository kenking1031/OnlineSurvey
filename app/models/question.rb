# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  content    :text
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Question < ActiveRecord::Base

  has_many :surveys
  belongs_to :user

  validates_presence_of :content
  validates_uniqueness_of :content
  validates_presence_of :user_id

  validates_length_of :content, :within => 5..200


  def total_surveys

    Survey.where({:question_id => id}).count

  end

  def yes_percent

    yes_surveys = Survey.where({:question_id => id, :response => "true"}).count

    if total_surveys > 0
    ((yes_surveys.to_f/total_surveys.to_f)*100).to_i
    else
      0
    end


  end

  def no_percent
    if total_surveys > 0
    (100 - yes_percent).to_i
    else
      0
    end

  end


end
