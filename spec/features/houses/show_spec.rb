# As a visitor
# When I visit '/houses/:id'
# Then I see the child with that id including the child's attributes

require 'rails_helper'

RSpec.describe 'houses show page', type: :feature do
  it 'displays the house address' do
    agent = Agent.create!( name:             "Steve Chicken",
                           licensed_realtor: true,
                           review_rating:    4.8)
    house_1 = agent.houses.create!( address:     "292 5th Ave",
                             price:       195000,
                             for_sale:    true)
    house_2 = agent.houses.create!( address:     "14 Cherry St",
                             price:       265000,
                             for_sale:    true)

    visit "/houses/#{house_1.id}"

    expect(page).to have_content(house_1.address)
    expect(page).to_not have_content(house_2.address)
  end

  it 'displays the house price' do
    agent = Agent.create!( name:             "Steve Chicken",
                           licensed_realtor: true,
                           review_rating:    4.8)
    house_1 = agent.houses.create!( address:     "292 5th Ave",
                             price:       195000,
                             for_sale:    true)
    house_2 = agent.houses.create!( address:     "14 Cherry St",
                             price:       265000,
                             for_sale:    true)

    visit "/houses/#{house_1.id}"

    expect(page).to have_content(house_1.price)
    expect(page).to_not have_content(house_2.price)
  end

  it 'displays if the house is for sale' do
    agent = Agent.create!( name:             "Steve Chicken",
                           licensed_realtor: true,
                           review_rating:    4.8)
    house_1 = agent.houses.create!( address:     "292 5th Ave",
                             price:       195000,
                             for_sale:    true)
    house_2 = agent.houses.create!( address:     "14 Cherry St",
                             price:       265000,
                             for_sale:    false)

    visit "/houses/#{house_1.id}"

    expect(page).to have_content(house_1.for_sale)
    expect(page).to_not have_content(house_2.for_sale)
  end

  it 'displays when the listing was created and updated' do
    agent = Agent.create!( name:             "Steve Chicken",
                           licensed_realtor: true,
                           review_rating:    4.8)
    house_1 = agent.houses.create!( address:     "292 5th Ave",
                             price:       195000,
                             for_sale:    true)
    house_2 = agent.houses.create!( address:     "14 Cherry St",
                             price:       265000,
                             for_sale:    false)

    visit "/houses/#{house_1.id}"

    expect(page).to have_content(house_1.created_at)
    expect(page).to have_content(house_1.updated_at)
  end

  it 'displays house real estate agent' do
    agent = Agent.create!( name:             "Steve Chicken",
                           licensed_realtor: true,
                           review_rating:    4.8)
    house_1 = agent.houses.create!( address:     "292 5th Ave",
                             price:       195000,
                             for_sale:    true)

    visit "/houses/#{house_1.id}"

    expect(page).to have_content(house_1.agent.name)
  end
end
