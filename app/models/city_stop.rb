class CityStop < ApplicationRecord
    belongs_to :stop
    belongs_to :city
end
