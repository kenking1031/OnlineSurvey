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

require 'spec_helper'

describe Question do



  before(:each) do
    @attr = {
        :content => 'Is this a test question?',
        :user_id => 1,
    }
  end

  it "should create a new instance given valid attributes" do
    Question.create!(@attr)
  end


  describe "content validations" do
    it "should require a content" do
      Question.new(@attr.merge(:content => " ")).should_not be_valid
    end

    it "should reject short question" do
      short="a"*4
      Question.new(@attr.merge(:content => short)).should_not be_valid
    end

    it "should reject long question" do
      long="a"*201
      Question.new(@attr.merge(:content => long)).should_not be_valid
    end
  end

  it "should reject empty user_id" do
    Question.new(@attr.merge(:user_id => " ")).should_not be_valid
  end



end
