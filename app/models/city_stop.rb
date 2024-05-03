class CityStop < ApplicationRecord
    belongs_to :stop
    belongs_to :city
      
    validates :stop_id, :city_id, presence: true  
end
