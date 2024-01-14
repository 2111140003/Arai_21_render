# app/models/team.rb
class Team < ApplicationRecord
    has_many :consumers
end
