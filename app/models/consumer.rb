# app/models/consumer.rb
class Consumer < ApplicationRecord
  has_secure_password
  belongs_to :team
end
