class Trip < ActiveRecord::Base
    belongs_to :driver
    belongs_to :rider
end