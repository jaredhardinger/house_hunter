# As a visitor
# When I visit '/agents/:id'
# Then I see the agent with that id including the parent's attributes: data from each column that is on the parent table

require 'rails_helper'

RSpec.describe 'agents show page', type: :feature do
  it 'displays the agent name' do
    agent_1 = Agent.create!( name:             "Steve Chicken",
                             licensed_realtor: true,
                             review_rating:    4.8)
    agent_2 = Agent.create!( name:             "Sharon Swindler",
                             licensed_realtor: false,
                             review_rating:    4.5)

    visit "/agents/#{agent_1.id}"

    expect(page).to have_content(agent_1.name)
    expect(page).to_not have_content(agent_2.name)
  end

  it 'displays the agent review rating' do
    agent_1 = Agent.create!( name:             "Steve Chicken",
                             licensed_realtor: true,
                             review_rating:    4.8)

    visit "/agents/#{agent_1.id}"

    expect(page).to have_content(agent_1.review_rating)
  end

  it 'displays the agent licensure status' do
    agent_1 = Agent.create!( name:             "Steve Chicken",
                             licensed_realtor: true,
                             review_rating:    4.8)

    visit "/agents/#{agent_1.id}"
    expect(page).to have_content(agent_1.licensed_realtor)
  end

  it 'displays the date created and updated' do
    agent_1 = Agent.create!( name:             "Steve Chicken",
                             licensed_realtor: true,
                             review_rating:    4.8)

    visit "/agents/#{agent_1.id}"
    expect(page).to have_content(agent_1.created_at)
    expect(page).to have_content(agent_1.updated_at)
  end

end
