class Restaurant < ApplicationRecord
    has_many :restaurant_review, -> { order "created_at DESC"}
    has_one_attached :image
end
