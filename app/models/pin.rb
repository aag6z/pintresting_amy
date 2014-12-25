class Pin < ActiveRecord::Base
     belongs_to :user
     has_attached_file :image, 
      :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
      :url => ":id/:style/:basename.:extension",
      :path => ":rails_root/app/assets/images/:id/:style/:basename.:extension",
      :default_url => "missing.jpg",
      :use_timestamp => false
     validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
     has_many :comments

end
