class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :avatar, 
    :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
    :url => ":id/:style/:basename.:extension",
    :path => ":rails_root/app/assets/images/:id/:style/:basename.:extension",
    :default_url => "missing.jpg",
    :use_timestamp => false
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/      
  validates :name, presence: true
  has_many :pins
end
