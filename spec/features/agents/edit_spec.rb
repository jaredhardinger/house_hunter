# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info
require 'rails_helper'

RSpec.describe 'agent update', type: :feature do
  it 'links to an agent update page' do
    agent_1 = Agent.create!( name:             "Steve Chicken",
                             licensed_realtor: true,
                             review_rating:    4.8)
    visit "/agents/#{agent_1.id}"

    click_link('Update Agent')
    expect(current_path).to eq("/agents/#{agent_1.id}/edit")
  end

  it 'can update an agent' do
    agent_1 = Agent.create!( name:             "Steve Chicken",
                             licensed_realtor: true,
                             review_rating:    4.8)

    visit "/agents/#{agent_1.id}"
    expect(page).to have_content('Steve Chicken')
    expect(page).to have_content(4.8)
    expect(page).to have_content(true)

    visit "/agents/#{agent_1.id}/edit"

    fill_in('Name', with: 'Steven Chicken')
    fill_in('review_rating', with: 4.5)
    click_button('Update Agent')

    expect(current_path).to eq("/agents/#{agent_1.id}")
    expect(page).to have_content("Steven Chicken")
    expect(page).to have_content(4.5)
    expect(page).to have_content(false)
  end
end
