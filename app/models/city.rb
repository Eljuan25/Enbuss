class City < ApplicationRecord
    has_many :stops
    has_many :trajectory

    validates :name, presence:true
end
