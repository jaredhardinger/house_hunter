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

  it 'links back to the house and agent index' do
    agent_1 = Agent.create!( name:             "Steve Chicken",
                             licensed_realtor: true,
                             review_rating:    4.8)

    visit "/agents/#{agent_1.id}/houses"
    click_link('Houses Index')
    expect(page).to have_current_path('/houses')

    visit "/agents/#{agent_1.id}/houses"
    click_link('Agents Index')
    expect(page).to have_current_path('/agents')
  end

  it 'can sort houses alphabetically' do
    agent = Agent.create!( name:             "Sally Closer",
                             licensed_realtor: true,
                             review_rating:    4.5)
    house_1 = agent.houses.create!( address:     "292 5th Ave",
                                      price:       195000,
                                      for_sale:    true)
    house_2 = agent.houses.create!( address:     "12 Circle Dr",
                                      price:       105000,
                                      for_sale:    false)
    house_3 = agent.houses.create!( address:     "651 Chestnut St",
                                      price:       385000,
                                      for_sale:    true)
    house_4 = agent.houses.create!( address:     "1014 River Rd",
                                      price:       895000,
                                      for_sale:    false)

    visit "/agents/#{agent.id}/houses"
    click_link('Sort Alphabetically')
    expect(current_path).to eq("/agents/#{agent.id}/houses")

    expect(all('.house-addy')[0].text).to eq(house_4.address)
    expect(all('.house-addy')[1].text).to eq(house_2.address)
    expect(all('.house-addy')[2].text).to eq(house_1.address)
    expect(all('.house-addy')[3].text).to eq(house_3.address)
  end

  it 'links to house edit page from agent house index page' do
    agent = Agent.create!( name:             "Steve Chicken",
                           licensed_realtor: true,
                           review_rating:    4.8)
    house = agent.houses.create!( address:     "292 5th Ave",
                                  price:       195000,
                                  for_sale:    true)

    visit "/agents/#{agent.id}/houses"
    click_link('Edit House')
    expect(page).to have_current_path("/houses/#{house.id}/edit")
  end
end
