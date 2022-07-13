# As a visitor
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information
require 'rails_helper'

RSpec.describe 'house update', type: :feature do
  it 'links to an update house page' do
    agent = Agent.create!( name:             "Steve Chicken",
                           licensed_realtor: true,
                           review_rating:    4.8)
    house = agent.houses.create!( address:     "292 5th Ave",
                             price:       195000,
                             for_sale:    true)

    visit "/houses/#{house.id}"

    click_link('Update House Details')
    expect(current_path).to eq("/houses/#{house.id}/edit")
  end

  it 'can update a house page' do
    agent = Agent.create!( name:             "Steve Chicken",
                           licensed_realtor: true,
                           review_rating:    4.8)
    house = agent.houses.create!( address:     "292 5th Ave",
                             price:       195000,
                             for_sale:    true)

    visit "/houses/#{house.id}"
    expect(page).to have_content('292 5th Ave')
    expect(page).to have_content(195000)
    expect(page).to have_content(true)

    visit "/houses/#{house.id}/edit"
    fill_in('address', with: '294 5th Ave')
    fill_in('price', with: 196000)
    click_button('Update House')

    expect(current_path).to eq("/houses/#{house.id}")
    expect(page).to have_content('294 5th Ave')
    expect(page).to have_content(196000)
    expect(page).to have_content(false)
  end
end
