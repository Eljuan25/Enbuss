class Schedule < ApplicationRecord
  belongs_to :trayectory
  belongs_to :stop
end
