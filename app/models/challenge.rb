class Challenge < ActiveRecord::Base
  belongs_to :adventure
  has_one :riddle
  has_many :questions
end
