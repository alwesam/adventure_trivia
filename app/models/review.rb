class Review < ActiveRecord::Base
  belongs_to :adventure

  validates :rating, presence: true, numericality: {greater_than: 0, less_than: 6}

end
