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

RSpec.describe 'Creating a awarded', type: :feature do
  scenario 'valid inputs' do
    
    #create type
    visit new_type_path
    fill_in 'Typename', with: 'Music'
    click_on 'Create Type'
    visit types_path
    expect(page).to have_content('Music')
    
    #create project
    visit new_project_path
    fill_in 'Projectname', with: 'Cool Song'
    select 'Music', :from => 'project[TypeID]'
    click_on 'Create Project'
    visit projects_path
    expect(page).to have_content('Cool Song')

    #create award
    visit new_award_path
    fill_in 'Awardname', with: 'Coolest Song'
    select 2022, :from => 'award[AwardYear(1i)]'
    select 'February', :from => 'award[AwardYear(2i)]'
    select 14, :from => 'award[AwardYear(3i)]'
    click_on 'Create Award'
    visit awards_path
    expect(page).to have_content('Coolest Song')

    #create awarded
    visit new_awarded_path
    select 2022, :from => 'awarded[AwardedDate(1i)]'
    select 'February', :from => 'awarded[AwardedDate(2i)]'
    select 14, :from => 'awarded[AwardedDate(3i)]'
    select 'Coolest Song', :from => 'awarded[AwardID]'
    select 'Cool Song', :from => 'awarded[ProjectID]'
    click_on 'Create Awarded'
    visit awardeds_path
    expect(page).to have_content('2022-02-14')
    expect(page).to have_content('Coolest Song')
    expect(page).to have_content('Cool Song')
  end
end  