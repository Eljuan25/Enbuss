class City < ApplicationRecord
    has_many :stops
    has_many :trajectories

    validates :name, presence:true
end
