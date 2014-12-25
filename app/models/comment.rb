class Comment < ActiveRecord::Base
  belongs_to :pin
  validates :pin_id, presence: true
  validates :text, presence: true, length: { maximum: 140 }
end
