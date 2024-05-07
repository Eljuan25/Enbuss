class Service < ApplicationRecord
    has_many : trajectory 

     validates :name, presence: true
end
