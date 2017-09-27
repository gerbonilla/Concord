# require 'net/http'
# require 'uri'
# require 'json'
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :profile
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  after_create :setup_profile

  def setup_profile
    profile = Profile.create(user: self)
    new_quovo = Quovo.users.create(email: self.email, name: self.email, username: self.email)
    self.update(quovo_user_id: new_quovo.id)
  end
end
