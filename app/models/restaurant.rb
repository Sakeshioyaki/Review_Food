class Restaurant < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_many :addresses, dependent: :destroy
end
