class Photo < ApplicationRecord

#Association belongs_to (opposite to one-to-many)
	belongs_to :user

#Association many-to-many
	has_many :comments, dependent: :destroy
	has_many :commenters, through: :comments, source: :user
	
	has_many :likes, dependent: :destroy
	has_many :liked_users, through: :likes, source: :user

#Paperclip
	has_attached_file :image,
										styles: { large: '640x400#', medium: '300x200#', thumb: '150x100#'},
										default_url: '/images/:style/missing.png'
	validates_attachment_content_type :image, 
                    content_type: ['image/jpeg', 'image/gif', 'image/png']

  def is_liked?(other_user)
		liked_users.include?(other_user)
	end
  
end
