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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    content "MyText my text"
    user_id "1"
  end
end

Dir[Rails.root + "factories/*.rb"].each do |file|
  require file
end