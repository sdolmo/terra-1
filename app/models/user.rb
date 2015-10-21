class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

  has_many :listings
  attr_accessor :login

  def self.find_for_database_authentication(warden_conditions)
    conditions[:email].downcase! if conditions[:email]
    where(conditions.to_h).first
  end
end
