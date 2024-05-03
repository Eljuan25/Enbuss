class Trajectory < ApplicationRecord
    has_and_belongs_to_many :stops
    belongs_to :city
    belongs_to :service

    validates :city_id, presence: true 
    validates :services_id, presence: true 
end
