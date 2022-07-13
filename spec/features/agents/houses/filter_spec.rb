# As a visitor
# When I visit the Parent's children Index Page
# I see a form that allows me to input a number value
# When I input a number value and click the submit button that reads 'Only return records with more than `number` of `column_name`'
# Then I am brought back to the current index page with only the records that meet that threshold shown.
require 'rails_helper'

RSpec.describe 'AgentHouses threshold filtering', type: :feature do
  it 'can filter with a form on the Agents Houses page' do
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
    fill_in('minimum_price', with: 200000)
    click_button('Submit')
  
    expect(current_path).to eq("/agents/#{agent.id}/houses")
    expect(page).to have_content("14 Cherry St")
    expect(page).to_not have_content("292 5th Ave")
  end
end
