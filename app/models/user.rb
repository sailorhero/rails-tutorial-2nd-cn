# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  remember_token  :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :email, :name,:password,:password_confirmation
  has_secure_password

  before_save {|user| user.email = email.downcase}
  before_save :create_remember_token

  validates_presence_of :name ,:email,:password,:password_confirmation
  validates_length_of :name, maximum:50
  validates_length_of :password,minimum:6
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates_uniqueness_of :email, case_sensitive:false  
  
  private
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
