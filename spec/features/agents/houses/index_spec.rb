# As a visitor
# When I visit '/agents/:agent_id/houses'
# Then I see each house associated with that agent including the house's attributes

require 'rails_helper'

RSpec.describe 'Agents houses page', type: :feature do
  it 'displays the house addresses' do
    agent = Agent.create!( name:             "Steve Chicken",
                           licensed_realtor: true,
                           review_rating:    4.8)
    house_1 = agent.houses.create!( address:     "292 5th Ave",
                             price:       195000,
                             for_sale:    true)
    house_2 = agent.houses.create!( address:     "14 Cherry St",
                             price:       265000,
                             for_sale:    true)

    visit "/agents/#{agent.id}/houses"

    expect(page).to have_content(house_1.address)
    expect(page).to have_content(house_2.address)
  end
end
