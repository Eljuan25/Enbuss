class Unit < ApplicationRecord
    has_one :trajectory
    has_many :types 

    validates :name, presence: true, length: { maximum: 50 }
    validates :capacity, presence: true
end
