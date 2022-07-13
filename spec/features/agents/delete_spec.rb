# As a visitor
# When I visit a parent show page
# Then I see a link to delete the parent
# When I click the link "Delete Parent"
# Then a 'DELETE' request is sent to '/parents/:id',
# the parent is deleted, and all child records are deleted
# and I am redirected to the parent index page where I no longer see this parent
require 'rails_helper'

RSpec.describe 'destroying an agent', type: :feature do
  it 'can delete the agent from the show page' do
    agent = Agent.create!( name:             "Sally Closer",
                           licensed_realtor: true,
                           review_rating:    4.5)
    house_1 = agent.houses.create!( address:     "292 5th Ave",
                                    price:       195000,
                                    for_sale:    true)
    house_2 = agent.houses.create!( address:     "12 Circle Dr",
                                    price:       105000,
                                    for_sale:    false)
    visit "/agents/#{agent.id}"

    click_link('Delete Agent')
    expect(current_path).to eq("/agents")
    expect(page).to_not have_content('Sally Closer')
  end

  it 'can delete the agent from the index page' do
    agent = Agent.create!( name:             "Sally Closer",
                           licensed_realtor: true,
                           review_rating:    4.5)
    house_1 = agent.houses.create!( address:     "292 5th Ave",
                                    price:       195000,
                                    for_sale:    true)
    house_2 = agent.houses.create!( address:     "12 Circle Dr",
                                    price:       105000,
                                    for_sale:    false)
    visit "/agents"

    click_link('Delete Agent')
    expect(current_path).to eq("/agents")
    expect(page).to_not have_content('Sally Closer')
  end
end
