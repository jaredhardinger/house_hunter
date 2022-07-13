# For each parent table
# As a visitor
# When I visit '/agents'
# Then I see the name of each agent record in the system

require 'rails_helper'

RSpec.describe 'agents index page', type: :feature do
  it 'can see all agents names' do
    agent_1 = Agent.create!( name:             "Steve Chicken",
                             licensed_realtor: true,
                             review_rating:    4.8)
    agent_2 = Agent.create!( name:             "Sharon Swindler",
                             licensed_realtor: false,
                             review_rating:    4.5)

    visit '/agents'

    expect(page).to have_content(agent_1.name)
    expect(page).to have_content(agent_2.name)
  end

  it 'can see all agents ordered by most recently created' do
    agent_1 = Agent.create!( name:             "Steve Chicken",
                             licensed_realtor: true,
                             review_rating:    4.8)
    agent_2 = Agent.create!( name:             "Shannon Tortellini",
                             licensed_realtor: true,
                             review_rating:    4.3)

    visit '/agents'

    expect(page).to have_content(agent_2.name)
  end

  it 'links back to the house and agent index' do
    agent_1 = Agent.create!( name:             "Steve Chicken",
                             licensed_realtor: true,
                             review_rating:    4.8)

    visit "/agents"
    click_link('Houses Index')
    expect(page).to have_current_path('/houses')

    visit "/agents"
    click_link('Agents Index')
    expect(page).to have_current_path('/agents')
  end

  it 'displays when the agent record was created' do
    agent_1 = Agent.create!( name:             "Steve Chicken",
                             licensed_realtor: true,
                             review_rating:    4.8)
    agent_2 = Agent.create!( name:             "Shannon Tortellini",
                             licensed_realtor: true,
                             review_rating:    4.3)

    visit '/agents'
    expect(page).to have_content("created:")
  end

  it 'links to agent edit page from agent index page' do
    agent_1 = Agent.create!( name:             "Steve Chicken",
                             licensed_realtor: true,
                             review_rating:    4.8)

    visit "/agents"
    click_link('Edit Agent')
    expect(page).to have_current_path("/agents/#{agent_1.id}/edit")
  end
end
