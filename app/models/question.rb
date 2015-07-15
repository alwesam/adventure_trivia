class Question < ActiveRecord::Base
  belongs_to :challenge
  has_many :answers
end
