class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_one_attached :image

         has_many :books, dependent: :destroy
         has_many :comments, dependent: :destroy

         has_many :relationships, foreign_key: :following_id

         has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: :follower_id

end
