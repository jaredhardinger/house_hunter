# As a visitor
# When I visit a Parent Childs Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed
require 'rails_helper'

RSpec.describe 'house creation', type: :feature do
  it 'links to a new house record' do
    agent_1 = Agent.create!( name:             "Steve Chicken",
                             licensed_realtor: true,
                             review_rating:    4.8)
    visit "/agents/#{agent_1.id}/houses"

    click_link('Add New House to Agent')
    expect(current_path).to eq("/agents/#{agent_1.id}/houses/new")
  end

  it 'can create an agents new house' do
    agent_1 = Agent.create!( name:             "Steve Chicken",
                             licensed_realtor: true,
                             review_rating:    4.8)
    visit "/agents/#{agent_1.id}/houses/new"

    fill_in('address', with: '1704 Walnut Circle')
    fill_in('price', with: 95000)
    check('for_sale')
    click_button('Create House')

    expect(current_path).to eq("/agents/#{agent_1.id}/houses")
    expect(page).to have_content('1704 Walnut Circle')
  end
end
