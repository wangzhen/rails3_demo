# == Schema Information
#
# Table name: sabro_firsts
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  email      :string(255)
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

class SabroFirst < ActiveRecord::Base
  validates_presence_of :email ,:name , :content
  validates_format_of :email, :unless => Proc.new{|p|p.email.blank?}, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
end
