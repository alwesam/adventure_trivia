class Question < ActiveRecord::Base
  belongs_to :challenge
  has_many :answers, dependent: :destroy

  validates :content, presence: true
end
