class Service < ApplicationRecord
    has_many :trajectories

    validates :name, presence: true
    has_and_belongs_to_many :units
end
