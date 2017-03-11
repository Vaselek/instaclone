class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	validates :name, presence: true, length: { maximum: 50 }
	
	# Recursive association many-to-many
	has_many :active_relationships, class_name: "Relationship",
																	foreign_key: "follower_id",
																	dependent: :destroy
	has_many :passive_relationships, class_name: "Relationship",
																	 foreign_key: "followed_id",
																	 dependent: :destroy
	has_many :following, through: :active_relationships,  source: :followed
	has_many :followers, through: :passive_relationships, source: :follower
	
	#Association one-to-many
	has_many :photos, dependent: :destroy

	#Associations many-to-many
	has_many :comments
	has_many :commented_photos, through: :comments, source: :photo
	
	has_many :likes
	has_many :liked_photos, through: :likes, source: :photo

	has_attached_file :avatar,
                    styles: { medium: '300x300>', thumb: '100x100>'},
                    default_url: '/avatars/:style/missing.png'
  validates_attachment_content_type :avatar, 
                    content_type: ['image/jpeg', 'image/gif', 'image/png']


	

	def follow(other_user)
		following << other_user
	end

	def unfollow(other_user)
		following.delete(other_user)
	end

	def following?(other_user)
		following.include?(other_user)
	end
	
	

end


