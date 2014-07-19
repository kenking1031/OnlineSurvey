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

require 'spec_helper'

describe Survey do

  before(:each) do
    @attr = {
        :response => 'true',
        :user_id => 1,
        :question_id => 2
    }
  end

  it "should create a new instance given valid attributes" do
    Survey.create!(@attr)
  end

  it "should require a response"  do
    Survey.new(@attr.merge(:response => " ")).should_not be_valid
  end

  it "should require a user_id" do
    Survey.new(@attr.merge(:user_id => " ")).should_not be_valid
  end

  it "should require a question id" do
    Survey.new(@attr.merge(:question_id => " ")).should_not be_valid
  end

end
