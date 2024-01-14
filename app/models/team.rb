class Team < ApplicationRecord
    has_many :consumers
    has_many :tasks
end