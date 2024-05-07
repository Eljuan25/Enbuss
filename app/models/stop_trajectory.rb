class StopTrajectory < ApplicationRecord
    belongs_to :trajectory
    belongs_to :stop
end
