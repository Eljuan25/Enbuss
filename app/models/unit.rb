class Unit < ApplicationRecord
    has_one :trajectory
    belongs_to :type

    validates :name, presence: true, length: { maximum: 50 }
    validates :capacity, presence: true
    has_and_belongs_to_many :services
end
