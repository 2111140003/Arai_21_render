# app/models/team.rb
class Team < ApplicationRecord
    belongs_to :consumer
    has_many :tasks
end
