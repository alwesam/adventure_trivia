class Adventure < ActiveRecord::Base
  has_many :challenges, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true

  def average_rating
    average = 0
    average = reviews.collect(&:rating).sum.to_f/reviews.count if reviews.count > 0  
    average.round(2)
  end

end
