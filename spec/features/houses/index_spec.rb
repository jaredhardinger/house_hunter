# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes

require 'rails_helper'

RSpec.describe 'houses index page', type: :feature do
  it 'can see all house names [street addresses]' do
    agent = Agent.create!( name:             "Steve Chicken",
                           licensed_realtor: true,
                           review_rating:    4.8)
    house_1 = agent.houses.create!( address:     "292 5th Ave",
                             price:       195000,
                             for_sale:    true)
    house_2 = agent.houses.create!( address:     "14 Cherry St",
                             price:       265000,
                             for_sale:    false)

    visit '/houses'

    expect(page).to have_content(house_1.address)
    expect(page).to have_content(house_2.address)
  end

  it 'can see all house prices' do
    agent = Agent.create!( name:             "Steve Chicken",
                           licensed_realtor: true,
                           review_rating:    4.8)
    house_1 = agent.houses.create!( address:     "292 5th Ave",
                             price:       195000,
                             for_sale:    true)
    house_2 = agent.houses.create!( address:     "14 Cherry St",
                             price:       265000,
                             for_sale:    false)

    visit '/houses'

    expect(page).to have_content(house_1.price)
    expect(page).to have_content(house_2.price)
  end

  it 'can see if house is for sale' do
    agent = Agent.create!( name:             "Steve Chicken",
                           licensed_realtor: true,
                           review_rating:    4.8)
    house_1 = agent.houses.create!( address:     "292 5th Ave",
                             price:       195000,
                             for_sale:    true)
    house_2 = agent.houses.create!( address:     "14 Cherry St",
                             price:       265000,
                             for_sale:    false)

    visit '/houses'

    expect(page).to have_content(house_1.for_sale)
    expect(page).to have_content(house_2.for_sale)
  end
end
