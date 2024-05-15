class City < ApplicationRecord
    has_many :stops

    validates :name, presence:true
end
