class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :adventures

  before_create :create_access_token
  
  validates :email, presence: true, uniqueness: true,
              format:  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  def create_access_token
    self.access_token = "#{self.id}:#{Devise.friendly_token}"
  end

end
