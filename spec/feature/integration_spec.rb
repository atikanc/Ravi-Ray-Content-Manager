# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a type', type: :feature do
    scenario 'valid inputs' do
      visit new_type_path
      fill_in 'Typename', with: 'Music'
      click_on 'Create Type'
      visit types_path
      expect(page).to have_content('Music')
    end
end

RSpec.describe 'Creating an award', type: :feature do
  scenario 'valid awards' do
    visit new_award_path
    fill_in 'Awardname', with: 'Test Award'
    fill_in 'Awardlink', with: 'test.com'
    select '2022', :from => 'award_AwardYear_1i'
    select 'February', :from => 'award_AwardYear_2i'
    select '12', :from => 'award_AwardYear_3i'
    click_on 'Create Award'
    visit awards_path
    expect(page).to have_content("Test Award")
    expect(page).to have_content("test.com")
    expect(page).to have_content("2022-02-12")
  end
end
  