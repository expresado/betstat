class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
has_many :bets, foreign_key: 'requesting_user_id'
validates :password, { confirmation: true, length: { in: 8..20 } } 

end
