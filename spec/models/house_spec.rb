require 'rails_helper'

RSpec.describe House, type: :model do
  it {should belong_to :agent}

  before :each do
    House.destroy_all
    Agent.destroy_all
    @agent_1 = Agent.create!( name:             "Steve Chicken",
                             licensed_realtor: true,
                             review_rating:    4.8)
    @agent_2 = Agent.create!( name:             "Sally Closer",
                             licensed_realtor: true,
                             review_rating:    4.5)
    @house_1 = @agent_1.houses.create!( address:     "292 5th Ave",
                                      price:       195000,
                                      for_sale:    true)
    @house_2 = @agent_1.houses.create!( address:     "12 Circle Dr",
                                      price:       105000,
                                      for_sale:    false)
    @house_3 = @agent_2.houses.create!( address:     "651 Chestnut St",
                                      price:       385000,
                                      for_sale:    true)
    @house_4 = @agent_2.houses.create!( address:     "1014 River Rd",
                                      price:       895000,
                                      for_sale:    false)
  end

  describe 'class methods' do
    it 'returns only for sale houses' do
      expect(House.for_sale).to include(@house_1)
      expect(House.for_sale).to include(@house_3)
      expect(House.for_sale).to_not include(@house_2)
      expect(House.for_sale).to_not include(@house_4)
    end
  end
end
