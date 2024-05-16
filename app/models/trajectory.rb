class Trajectory < ApplicationRecord
    has_and_belongs_to_many :stops
    belongs_to :city
    has_many :schedules
end
