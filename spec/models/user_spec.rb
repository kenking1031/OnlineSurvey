# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  e_psd      :string(255)
#  salt       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe User do

  before(:each) do
    @attr = {
        :name => "Jason Jiang",
        :email => "test@test.com",
        :password => "testtest",
        :password_confirmation =>"testtest"
    }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@attr)
  end

  describe "password validations" do
    it "should require a password" do
      User.new(@attr.merge(:password => " ", :password_confirmation => " ")).
      should_not be_valid
    end

    it "should require a matching password confirmation" do
      User.new(@attr.merge(:password_confirmation => "invalid")).
      should_not be_valid
    end

    it "should reject short passwords" do
      short = "a" * 4
      hash = @attr.merge(:password => short, :password_confirmation => short)
      User.new(hash).should_not be_valid
    end

    it "should reject long passwords" do
      long = "a"* 50
      hash = @attr.merge(:password => long, :password_confirmation => long)
      User.new(hash).should_not be_valid
    end

  end


  it "should reject invaild email address" do
    invalid_email = "fsdfdssfd"
    hash = @attr.merge(:email => invalid_email)
    User.new(hash).should_not be_valid
  end

  it "should require a name" do
    User.new(@attr.merge(:name => " ")).should_not be_valid
  end


end
