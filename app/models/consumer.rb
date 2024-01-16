# app/models/consumer.rb
class Consumer < ApplicationRecord
  has_secure_password
  has_many :teams
end
