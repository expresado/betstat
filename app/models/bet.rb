class Bet < ActiveRecord::Base
	attr_accessor :team1, :team2
  validates :bet,  :presence => true
  validates :course, :presence => true

  validates_presence_of :match, allow_nil:true
  validates_presence_of :team1, allow_nil:true
  validates_presence_of :team2, allow_nil:true
  validate :xor_match

  belongs_to :user
  accepts_nested_attributes_for :user
  scope :last30, -> { where(created_at: Time.now - (60*60*24*30)..Time.now) }
  scope :last7, -> { where(created_at: Time.now - (60*60*24*7)..Time.now) }

  def before_save
  	self.match = self.team1 + " - " + self.team2
  end
private
  def xor_match
    if team1.blank? && team2.blank? || match.blank?
      errors.add(:base, "chyba zapisu")
    end
  end
end
