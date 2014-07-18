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

require 'digest'
require 'bcrypt'
class User < ActiveRecord::Base

  attr_accessor :password
  validates_uniqueness_of :email
  validates_length_of :email, :within => 5..50
  validates_format_of :email, :with =>  /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i, :multiline => true

  validates_presence_of :name
  validates_length_of :name, :within =>4..50
  validates_confirmation_of :password
  validates_length_of :password, :within => 4..20
  validates_presence_of :password

  has_many :surveys
  has_many :questions, :through => :surveys

  before_save :encrypt_new_password

  def self.authenticate(email, password)
    user = find_by_email(email)
    return user if user && user.authenticated?(password)
  end

  def authenticated?(password)
    self.e_psd == encrypt(password)
  end

  protected

  def encrypt_new_password
    return if password.blank?
    self.salt = make_salt if new_record?
    self.e_psd = encrypt(password)
  end

  def password_required?
    e_psd.blank? || password.present?
  end

  def secure_hash(string)
    Digest::SHA1.hexdigest(string)
  end

  def make_salt
    secure_hash("#{Time.now.utc}--#{password}")
  end

  def encrypt(string)
    secure_hash("#{salt}--#{string}")
  end
end