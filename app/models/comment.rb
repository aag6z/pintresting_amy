class Comment < ActiveRecord::Base
   
  has_one :user, through: :pins
  has_one :pin
  
  
  validates :text, presence: true, length: { maximum: 140 }
end
