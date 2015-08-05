class Adventure < ActiveRecord::Base
  has_many :challenges, dependent: :destroy
  has_many :reviews, dependent: :destroy

  before_create :generate_random_token

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true

  def average_rating
    average = 0
    average = reviews.collect(&:rating).sum.to_f/reviews.count if reviews.count > 0  
    average.round(2)
  end

  private

  def generate_random_token
    begin
      self.token = SecureRandom.hex
    end while Adventure.exists?(token: self.token)
  end

end
