class Answer < ApplicationRecord
   has_many :favorites
  # has_many :users, through: :favorites
   
   # has_many :reports, dependent: :destroy 
   
   belongs_to :user
   belongs_to :subject
   
   def favorited_by?(user)
    favorites.exists?(user_id: user.id)
   end
   
end
