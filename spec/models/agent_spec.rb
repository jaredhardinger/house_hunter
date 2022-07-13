require 'rails_helper'

RSpec.describe Agent, type: :model do
  it {should have_many :houses}

  describe 'class methods' do
    describe 'newest_first' do
      it 'returns houses ordered by most recent creation' do
        agent_1 = Agent.create!( name:             "Steve Chicken",
                               licensed_realtor: true,
                               review_rating:    4.8)
        agent_2 = Agent.create!( name:             "Shannon Tortellini",
                               licensed_realtor: true,
                               review_rating:    4.3)

        expect(Agent.newest_first).to eq([agent_2, agent_1])
      end
    end
  end
end
