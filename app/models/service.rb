class Service < ApplicationRecord
    has_many :trajectories

     validates :name, presence: true
end
