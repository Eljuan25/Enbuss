class Unit < ApplicationRecord
    has_one :trajectory
    belongs_to :type
    has_and_belongs_to_many :services

    validates :name, presence: true, length: { maximum: 50 }
    validates :capacity, presence: true 
end
