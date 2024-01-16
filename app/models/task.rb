class Task < ApplicationRecord
    belongs_to :team ,foreign_key: 'team_id'
end
