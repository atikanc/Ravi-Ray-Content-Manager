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

RSpec.describe 'Creating a project', type: :feature do
    scenario 'valid inputs' do
      # make music type
      visit new_type_path
      fill_in 'Typename', with: 'Music'
      click_on 'Create Type'
      visit types_path
      expect(page).to have_content('Music')

      visit new_project_path
      fill_in 'Projectname', with: 'projectname1'
      fill_in 'Projectlink', with: 'projectlink1'
      fill_in 'Projectowner', with: 'projectowner1'
      fill_in 'Projectdescription', with: 'projectdescription1'
      select 2017, :from => 'project[ProjectStart(1i)]'
      select 'January', :from => 'project[ProjectStart(2i)]'
      select 30, :from => 'project[ProjectStart(3i)]'
      select 2021, :from => 'project[ProjectEnd(1i)]'
      select 'January', :from => 'project[ProjectEnd(2i)]'
      select 29, :from => 'project[ProjectEnd(3i)]'
      find('#project_TypeID').find(:xpath, 'option[2]').select_option
      click_on 'Create Project'
      visit projects_path
      expect(page).to have_content('2017')
      expect(page).to have_content('30')
      expect(page).to have_content('2021')
      expect(page).to have_content('29')
      expect(page).to have_content('projectname1')
      expect(page).to have_content('projectlink1')
      expect(page).to have_content('projectowner1')
      expect(page).to have_content('projectdescription1')
      expect(page).to have_content('Music')
    end
  end

RSpec.describe 'Creating a display line', type: :feature do
    scenario 'valid inputs' do
      # make music type
      visit new_type_path
      fill_in 'Typename', with: 'Music'
      click_on 'Create Type'
      visit types_path
      expect(page).to have_content('Music')

      # make project
      visit new_project_path
      fill_in 'Projectname', with: 'projectname1'
      fill_in 'Projectlink', with: 'projectlink1'
      fill_in 'Projectowner', with: 'projectowner1'
      fill_in 'Projectdescription', with: 'projectdescription1'
      select 2017, :from => 'project[ProjectStart(1i)]'
      select 'January', :from => 'project[ProjectStart(2i)]'
      select 30, :from => 'project[ProjectStart(3i)]'
      select 2021, :from => 'project[ProjectEnd(1i)]'
      select 'January', :from => 'project[ProjectEnd(2i)]'
      select 29, :from => 'project[ProjectEnd(3i)]'
      find('#project_TypeID').find(:xpath, 'option[2]').select_option
      click_on 'Create Project'

      # make contribution type
      visit new_contribution_path
      fill_in 'Contributiontype', with: 'contributiontype'
      click_on 'Create Contribution'

      visit new_display_line_path
      fill_in 'Componentcontributed', with: 'something1'
      select 2017, :from => 'display_line[ComponentStartDate(1i)]'
      select 'January', :from => 'display_line[ComponentStartDate(2i)]'
      select 30, :from => 'display_line[ComponentStartDate(3i)]'
      select 2021, :from => 'display_line[ComponentEndDate(1i)]'
      select 'January', :from => 'display_line[ComponentEndDate(2i)]'
      select 29, :from => 'display_line[ComponentEndDate(3i)]'
      find('#display_line_ContribProject').find(:xpath, 'option[2]').select_option
      find('#display_line_ContribType').find(:xpath, 'option[2]').select_option
      click_on 'Create Display line'
      visit display_lines_path
      expect(page).to have_content('contributiontype')
      expect(page).to have_content('2017-01-30')
      expect(page).to have_content('2021-01-29')
      expect(page).to have_content('something1')
      expect(page).to have_content('projectname1')
    end
  end