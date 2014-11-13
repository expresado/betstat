class Bet < ActiveRecord::Base
	attr_accessor :team1, :team2
  validates :bet,  :presence => true
  validates :course, :presence => true

  validates :team1, :presence => true
  validates :team2, :presence => true
  belongs_to :user
  accepts_nested_attributes_for :user
  scope :last30, -> { where(created_at: Time.now - (60*60*24*30)..Time.now) }
  scope :last7, -> { where(created_at: Time.now - (60*60*24*7)..Time.now) }

  def before_save
  	self.match = self.team1 + " - " + self.team2
  end

end
