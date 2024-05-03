class City < ApplicationRecord
    has_many :stops

    validate :name, presence:true
end
