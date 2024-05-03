class UnitsTrajectoriesModel < ApplicationRecord
    class UnitsTrajectory < ApplicationRecord
    belongs_to :unit
    belongs_to :trajectory
      
end
