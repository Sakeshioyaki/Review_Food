class RestaurantReview < ApplicationRecord
    belongs_to :user
    belongs_to :retaurant
end
