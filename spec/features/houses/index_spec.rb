# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes

require 'rails_helper'

RSpec.describe 'houses index page', type: :feature do
  it 'can see all house names [street addresses]' do
    house_1 = House.create!( address:     "292 5th Ave",
                             price:       195000,
                             for_sale:    true)
    house_2 = House.create!( address:     "14 Cherry St",
                             price:       265000,
                             for_sale:    true)

    visit '/houses'

    expect(page).to have_content(house_1.address)
    expect(page).to have_content(house_2.address)
  end

  it 'can see all house prices' do
    house_1 = House.create!( address:     "292 5th Ave",
                             price:       195000,
                             for_sale:    true)
    house_2 = House.create!( address:     "14 Cherry St",
                             price:       265000,
                             for_sale:    true)

    visit '/houses'

    expect(page).to have_content(house_1.price)
    expect(page).to have_content(house_2.price)
    save_and_open_page
  end

  it 'can see if house is for sale' do
    house_1 = House.create!( address:     "292 5th Ave",
                             price:       195000,
                             for_sale:    true)
    house_2 = House.create!( address:     "14 Cherry St",
                             price:       265000,
                             for_sale:    true)

    visit '/houses'

    expect(page).to have_content(house_1.for_sale)
    expect(page).to have_content(house_2.for_sale)
    save_and_open_page
  end
end
