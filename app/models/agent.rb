class Agent < ApplicationRecord
  has_many :houses, dependent: :delete_all

  def self.newest_first
    Agent.order(created_at: :desc)
  end
end
