class Bet < ActiveRecord::Base
  validates :bet,  :presence => true
  validates :course, :presence => true

  validates :match, :presence => true
  belongs_to :user
  accepts_nested_attributes_for :user

end
