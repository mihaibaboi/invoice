require 'digest/sha1'

class User < ActiveRecord::Base
  belongs_to :user_type
  has_many :invoices
  
  attr_accessor :password
  
  validates_presence_of :username
  validates_length_of :username, :within => 6..25
  validates_uniqueness_of :username
  validates_presence_of :password, :on => :create
  validates_length_of :password, :minimum => 6, :on => :create
  validates_presence_of :email
  validates_confirmation_of :email
  
  before_save :create_hashed_password
  after_save :clear_password
  
  def self.generate_salt(username="")
    Digest::SHA1.hexdigest("Combine #{username} and #{Time.now} for salt string")
  end
  
  def self.hash_with_salt(password="", salt="")
    Digest::SHA1.hexdigest("Put #{salt} on the #{password}")
  end

  def self.authenticate(username="", password="")
    user = User.where("username = ?", username).first
    if user && user.password_match?(password)
      return user
    else
      return false
    end
  end

  def password_match?(password="")
    hashed_password == User.hash_with_salt(password, salt)
  end

  private
  
  def create_hashed_password
    unless password.blank?
      self.salt = User.generate_salt(username) if salt.blank?
      self.hashed_password = User.hash_with_salt(password, salt)
    end
  end

  def clear_password
    self.password = nil
  end
end