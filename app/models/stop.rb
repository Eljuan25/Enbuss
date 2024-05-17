class Stop < ApplicationRecord
    belongs_to :city 

    validates :name, presence: true
    validates :address, presence: true  
    
    def self.find_with_schedules(id)
        includes(:schedules).find(id)
    end
end


