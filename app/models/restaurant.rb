class Restaurant < ApplicationRecord
    has_many :reviews, -> { order "created_at DESC"}
    has_one_attached :image
end
