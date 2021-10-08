class Driver < ActiveRecord::Base
    has_many :trips
    has_many :riders, through: :trips
end