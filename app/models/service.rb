class Service < ApplicationRecord
    has_and_belongs_to_many :units

    validates :name, presence: true
end
