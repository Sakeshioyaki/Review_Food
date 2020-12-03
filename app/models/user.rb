class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :full_name, presence: true
  has_one_attached :avatar
  has_many :reviews, -> { order "created_at DESC"}
end
