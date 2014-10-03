class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :projects

  before_create :assign_token

  def self.find_by_auth_token token
    User.find_by_auth_token token
  end

  def assign_token
    self.auth_token = SecureRandom.hex
  end
end
