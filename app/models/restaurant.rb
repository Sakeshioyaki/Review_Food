class Restaurant < ApplicationRecord
    has_many :reviews, -> { order "created_at DESC"}, dependent: :destroy
    has_many :addresses, -> { order "created_at DESC"}, dependent: :destroy
    has_one_attached :image
end
