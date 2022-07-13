# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.
require 'rails_helper'

RSpec.describe 'agent creation', type: :feature do
  it 'links to a new agent record' do
    visit '/agents'

    click_link('New Agent')
    expect(current_path).to eq('/agents/new')
  end

  it 'can create a new agent' do
    visit '/agents/new'

    fill_in('Name', with: 'Juliann Dealmaker')
    fill_in('review_rating', with: 4.1)
    check('licensed_realtor')
    click_button('Create Agent')

    expect(current_path).to eq("/agents")
    expect(page).to have_content("Juliann Dealmaker")
  end
end
