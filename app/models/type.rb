class Type < ApplicationRecord
    has_many :unit

    validates :name, presence: true
end
