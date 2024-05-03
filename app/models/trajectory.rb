class Trajectory < ApplicationRecord
    has_and_belongs_to_many :stops
    belongs_to :city
    belongs_to :service

end
