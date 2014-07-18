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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :survey do
    response 1
    user_id 1
    question_id 1
  end
end
