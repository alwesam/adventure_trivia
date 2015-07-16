class Adventure < ActiveRecord::Base
  has_many :challenges, dependent: :destroy

  #accepts_nested_attributes_for :challenges, allow_destroy: true,
  #  reject_if: lambda {|x| x[:location].empty? }

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
end
