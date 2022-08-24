class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        has_one_attached :image

        has_many :books, dependent: :destroy
        has_many :comments, dependent: :destroy

        has_many :relationships, foreign_key: :following_id
        has_many :followings, through: :relationships, source: :follower
        has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: :follower_id
        has_many :followers, through: :reverse_of_relationships, source: :following

        def is_followed?(user)
          reverse_of_relationships.find_by(following_id: user.id).present?
        end

        def is_following?(user)
          followings.include?(user)
        end
end
