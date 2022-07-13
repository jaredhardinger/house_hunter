class Agent < ApplicationRecord
  has_many :houses

  def self.newest_first
    Agent.order(created_at: :desc)
  end
end
