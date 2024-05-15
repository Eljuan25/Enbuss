class Trajectory < ApplicationRecord
    has_and_belongs_to_many :stops
    belongs_to :city
    has_many :schedules

    def self.find_with_schedules(id)
        includes(:schedules).find(id)
    end
end
