# == Schema Information
#
# Table name: administrators
#
#  id              :integer(4)      not null, primary key
#  name            :string(255)
#  salted_password :string(255)
#  salt            :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

require "digest/sha1"
class Administrator < ActiveRecord::Base


  attr_accessor :password
  #  attr_accessor :confirmation_password
  validates_presence_of :name
  validates_presence_of :password ,:on => :create
  validates_confirmation_of :password , :if => :password_changed?
  validates_uniqueness_of :name

  def before_save
    unless password.blank?
      self.salt = self.class.encrypt("Generate Salt", Time.now.to_f)
      self.salted_password = self.class.encrypt(password, self.salt)
    end
  end

  def self.authorize(name, password)
    admin = find_by_name(name)
    #    if admin && admin.salted_password == encrypt(password, admin.salt) && admin.is_active
    if admin && admin.salted_password == encrypt(password, admin.salt)
      return admin
    else
      return nil
    end
  end

  protected
  def self.encrypt(string, salt)
    Digest::SHA1.hexdigest("#{string} - SHA1 - #{REST_AUTH_SITE_KEY} - #{salt}")
  end

  def password_changed?
    !self.password.blank?
  end

end
