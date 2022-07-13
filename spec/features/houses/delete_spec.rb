# As a visitor
# When I visit a child show page
# Then I see a link to delete the child "Delete Child"
# When I click the link
# Then a 'DELETE' request is sent to '/child_table_name/:id',
# the child is deleted,
# and I am redirected to the child index page where I no longer see this child
require 'rails_helper'

RSpec.describe 'destroying a house', type: :feature do
  it 'can delete the house from the show page' do
    agent = Agent.create!( name:             "Sally Closer",
                           licensed_realtor: true,
                           review_rating:    4.5)
    house = agent.houses.create!( address:     "292 5th Ave",
                                    price:       195000,
                                    for_sale:    true)

    visit "/houses"
    expect(page).to have_content('292 5th Ave')

    visit "/houses/#{house.id}"
    click_link('Delete House')
    expect(current_path).to eq("/houses")
    expect(page).to_not have_content('292 5th Ave')
  end

  it 'can delete the house from the house index page' do
    agent = Agent.create!( name:             "Sally Closer",
                           licensed_realtor: true,
                           review_rating:    4.5)
    house = agent.houses.create!( address:     "292 5th Ave",
                                    price:       195000,
                                    for_sale:    true)

    visit "/houses"
    expect(page).to have_content('292 5th Ave')
    click_link('Delete House')
    expect(current_path).to eq("/houses")
    expect(page).to_not have_content('292 5th Ave')
  end
end
