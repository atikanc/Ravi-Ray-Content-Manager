require 'rails_helper'

def sign_in
    Rails.application.env_config['devise.mapping'] = Devise.mappings[:admin]
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_admin]
    visit root_path
    # sign in and verify sign in
    click_on('Sign in with Google')
end

RSpec.describe 'Creating a type', type: :feature do
  it 'valid inputs' do
    sign_in
    visit new_type_path
    fill_in 'type[TypeName]', with: 'Music', visible: true
    click_on 'Create Type'
    visit types_path
    expect(page).to have_content('Music')
  end
end

RSpec.describe('Creating an award', type: :feature) do
  it 'valid awards' do
    sign_in
    visit new_award_path
    fill_in 'award[AwardName]', with: 'Test Award'
    fill_in 'award[AwardLink]', with: 'test.com'
    select '2022', :from => 'award_AwardYear_1i'
    select 'February', :from => 'award_AwardYear_2i'
    select '12', :from => 'award_AwardYear_3i'
    click_on 'Create Award'
    visit awards_path
    expect(page).to(have_content('Test Award'))
    expect(page).to(have_content('test.com'))
    expect(page).to(have_content('2022-02-12'))
  end
end

RSpec.describe 'Creating an awarded', type: :feature do
  scenario 'valid inputs' do
    sign_in
    #create type
    visit new_type_path
    fill_in 'type_TypeName', with: 'Music'
    click_on 'Create Type'
    visit types_path
    expect(page).to have_content('Music')
    
    #create project
    visit new_project_path
    fill_in 'project_ProjectName', with: 'Cool Song'
    select 'Music', :from => 'project[TypeID]'
    click_on 'Create Project'
    visit projects_path
    expect(page).to have_content('Cool Song')

    #create award
    visit new_award_path
    fill_in 'award_AwardName', with: 'Coolest Song'
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

RSpec.describe 'Creating a project', type: :feature do
  scenario 'valid inputs' do
    sign_in
    # make music type
    visit new_type_path
    fill_in 'type_TypeName', with: 'Music'
    click_on 'Create Type'
    visit types_path
    expect(page).to have_content('Music')

    visit new_project_path
    fill_in 'project_ProjectName', with: 'projectname1'
    fill_in 'project_ProjectLink', with: 'projectlink1'
    fill_in 'project_ProjectOwner', with: 'projectowner1'
    fill_in 'project_ProjectDescription', with: 'projectdescription1'
    select 2017, :from => 'project[ProjectStart(1i)]'
    select 'January', :from => 'project[ProjectStart(2i)]'
    select 30, :from => 'project[ProjectStart(3i)]'
    select 2021, :from => 'project[ProjectEnd(1i)]'
    select 'January', :from => 'project[ProjectEnd(2i)]'
    select 29, :from => 'project[ProjectEnd(3i)]'
    find('#project_TypeID').find(:xpath, 'option[2]').select_option
    click_on 'Create Project'
    visit projects_path
    expect(page).to have_content('2021')
    expect(page).to have_content('29')
    expect(page).to have_content('projectname1')
    expect(page).to have_link(href: 'http://projectlink1')
    expect(page).to have_content('projectowner1')
    expect(page).to have_content('Music')
  end

  scenario 'filtering the correct projects by type' do
    sign_in
    #Make music type
    visit new_type_path
    fill_in 'type_TypeName', with: 'Music'
    click_on 'Create Type'
    
    #Make podcast type
    visit new_type_path
    fill_in 'type_TypeName', with: 'Podcast'
    click_on 'Create Type'

    #Make the music project
    visit new_project_path
    fill_in 'project_ProjectName', with: 'projectname1'
    fill_in 'project_ProjectLink', with: 'projectlink1'
    fill_in 'project_ProjectOwner', with: 'projectowner1'
    fill_in 'project_ProjectDescription', with: 'projectdescription1'
    select 2017, :from => 'project[ProjectStart(1i)]'
    select 'January', :from => 'project[ProjectStart(2i)]'
    select 30, :from => 'project[ProjectStart(3i)]'
    select 2021, :from => 'project[ProjectEnd(1i)]'
    select 'January', :from => 'project[ProjectEnd(2i)]'
    select 29, :from => 'project[ProjectEnd(3i)]'
    find('#project_TypeID').find(:xpath, 'option[2]').select_option
    click_on 'Create Project'

    #Make the podcast project
    visit new_project_path
    fill_in 'project_ProjectName', with: 'projectname2'
    fill_in 'project_ProjectLink', with: 'projectlink2'
    fill_in 'project_ProjectOwner', with: 'projectowner2'
    fill_in 'project_ProjectDescription', with: 'projectdescription2'
    select 2017, :from => 'project[ProjectStart(1i)]'
    select 'January', :from => 'project[ProjectStart(2i)]'
    select 30, :from => 'project[ProjectStart(3i)]'
    select 2022, :from => 'project[ProjectEnd(1i)]'
    select 'January', :from => 'project[ProjectEnd(2i)]'
    select 29, :from => 'project[ProjectEnd(3i)]'
    find('#project_TypeID').find(:xpath, 'option[3]').select_option
    click_on 'Create Project'

    #check filtering
    visit projects_public_path
    click_on 'filterBtn'
    page.check('search_multibox_podcast')
    click_on 'Search'
    find('#projectname2').click
    expect(page).to have_content('projectname2')
    expect(page).to have_content('projectowner2')
  end

  scenario 'filtering the correct projects by contribution' do
    sign_in
    #Make music type
    visit new_type_path
    fill_in 'type_TypeName', with: 'Music'
    click_on 'Create Type'
    
    #Make podcast type
    visit new_type_path
    fill_in 'type_TypeName', with: 'Podcast'
    click_on 'Create Type'

    #Make the music project
    visit new_project_path
    fill_in 'project_ProjectName', with: 'projectname1'
    fill_in 'project_ProjectLink', with: 'projectlink1'
    fill_in 'project_ProjectOwner', with: 'projectowner1'
    fill_in 'project_ProjectDescription', with: 'projectdescription1'
    select 2017, :from => 'project[ProjectStart(1i)]'
    select 'January', :from => 'project[ProjectStart(2i)]'
    select 30, :from => 'project[ProjectStart(3i)]'
    select 2021, :from => 'project[ProjectEnd(1i)]'
    select 'January', :from => 'project[ProjectEnd(2i)]'
    select 29, :from => 'project[ProjectEnd(3i)]'
    find('#project_TypeID').find(:xpath, 'option[2]').select_option
    click_on 'Create Project'

    #Make the podcast project
    visit new_project_path
    fill_in 'project_ProjectName', with: 'projectname2'
    fill_in 'project_ProjectLink', with: 'projectlink2'
    fill_in 'project_ProjectOwner', with: 'projectowner2'
    fill_in 'project_ProjectDescription', with: 'projectdescription2'
    select 2017, :from => 'project[ProjectStart(1i)]'
    select 'January', :from => 'project[ProjectStart(2i)]'
    select 30, :from => 'project[ProjectStart(3i)]'
    select 2022, :from => 'project[ProjectEnd(1i)]'
    select 'January', :from => 'project[ProjectEnd(2i)]'
    select 29, :from => 'project[ProjectEnd(3i)]'
    find('#project_TypeID').find(:xpath, 'option[3]').select_option
    click_on 'Create Project'

    #Make the displayline that will be assigned to project 2
    visit new_display_line_path
    select 2022, :from => 'display_line[ComponentStartDate(1i)]'
    select 'April', :from => 'display_line[ComponentStartDate(2i)]'
    select 1, :from => 'display_line[ComponentStartDate(3i)]'
    select 2022, :from => 'display_line[ComponentEndDate(1i)]'
    select 'April', :from => 'display_line[ComponentEndDate(2i)]'
    select 1, :from => 'display_line[ComponentEndDate(3i)]'
    select 'projectname2', :from => 'display_line[Project_id]'

    # filter by podcast types
    visit projects_public_path
    page.check('search_multibox_podcast')
    click_on 'Search'
    find('#projectname2').click
    expect(page).to have_content('projectname2')
    expect(page).to have_content('projectowner2')
  end

  scenario 'filtering the correct projects by contribution and type' do
    sign_in
    #Make music type
    visit new_type_path
    fill_in 'type_TypeName', with: 'Music'
    click_on 'Create Type'
    
    #Make podcast type
    visit new_type_path
    fill_in 'type_TypeName', with: 'Podcast'
    click_on 'Create Type'

    #Make contribution type
    visit new_contribution_path
    fill_in 'contribution_ContributionType', with: 'Mixing'
    click_on 'Create Contribution'

    #Make the music project
    visit new_project_path
    fill_in 'project_ProjectName', with: 'projectname1'
    fill_in 'project_ProjectLink', with: 'projectlink1'
    fill_in 'project_ProjectOwner', with: 'projectowner1'
    fill_in 'project_ProjectDescription', with: 'projectdescription1'
    select 2017, :from => 'project[ProjectStart(1i)]'
    select 'January', :from => 'project[ProjectStart(2i)]'
    select 30, :from => 'project[ProjectStart(3i)]'
    select 2021, :from => 'project[ProjectEnd(1i)]'
    select 'January', :from => 'project[ProjectEnd(2i)]'
    select 29, :from => 'project[ProjectEnd(3i)]'
    select 'Music', :from => 'project[TypeID]'
    click_on 'Create Project'

    #Make the podcast project
    visit new_project_path
    fill_in 'project_ProjectName', with: 'projectname2'
    fill_in 'project_ProjectLink', with: 'projectlink2'
    fill_in 'project_ProjectOwner', with: 'projectowner2'
    fill_in 'project_ProjectDescription', with: 'projectdescription2'
    select 2017, :from => 'project[ProjectStart(1i)]'
    select 'January', :from => 'project[ProjectStart(2i)]'
    select 30, :from => 'project[ProjectStart(3i)]'
    select 2022, :from => 'project[ProjectEnd(1i)]'
    select 'January', :from => 'project[ProjectEnd(2i)]'
    select 29, :from => 'project[ProjectEnd(3i)]'
    select 'Podcast', :from => 'project[TypeID]'
    click_on 'Create Project'

    #create the display line
    visit new_display_line_path
    fill_in 'display_line_ComponentContributed', with: "Music"
    select 2022, :from => 'display_line[ComponentStartDate(1i)]'
    select 'April', :from => 'display_line[ComponentStartDate(2i)]'
    select 1, :from => 'display_line[ComponentStartDate(3i)]'
    select 'projectname2', :from => 'display_line[Project_id]'
    select 'Mixing', :from => 'display_line[Contribution_id]'
    click_on 'Create Project-Contribution Association'

    visit display_lines_path
    expect(page).to have_content('Mixing')
    expect(page).to have_content('projectname2')

    visit projects_public_path
    page.check('search_multibox_mixing')
    page.check('search_multibox_podcast')
    click_on 'Search'
    find('#projectname2').click
    expect(page).to have_content('projectname2')
    expect(page).to have_content('projectowner2')
    expect(page).to have_content('Podcast')
  end
end

RSpec.describe 'Creating a display line', type: :feature do
  scenario 'valid inputs' do
    sign_in
    # make music type
    visit new_type_path
    fill_in 'type_TypeName', with: 'Music'
    click_on 'Create Type'
    visit types_path
    expect(page).to have_content('Music')

    # make project
    visit new_project_path
    fill_in 'project_ProjectName', with: 'projectname1'
    fill_in 'project_ProjectLink', with: 'projectlink1'
    fill_in 'project_ProjectOwner', with: 'projectowner1'
    fill_in 'project_ProjectDescription', with: 'projectdescription1'
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
    fill_in 'contribution_ContributionType', with: 'contributiontype'
    click_on 'Create Contribution'

    visit new_display_line_path
    fill_in 'display_line_ComponentContributed', with: 'something1'
    select 2017, :from => 'display_line[ComponentStartDate(1i)]'
    select 'January', :from => 'display_line[ComponentStartDate(2i)]'
    select 30, :from => 'display_line[ComponentStartDate(3i)]'
    select 2021, :from => 'display_line[ComponentEndDate(1i)]'
    select 'January', :from => 'display_line[ComponentEndDate(2i)]'
    select 29, :from => 'display_line[ComponentEndDate(3i)]'
    find('#display_line_Project_id').find(:xpath, 'option[2]').select_option
    find('#display_line_Contribution_id').find(:xpath, 'option[2]').select_option
    click_on 'Create Project-Contribution Association'
    visit display_lines_path
    expect(page).to have_content('2017-01-30')
    expect(page).to have_content('2021-01-29')
    expect(page).to have_content('something1')
  end
end

RSpec.describe 'Creating a contribution type', type: :feature do
  scenario 'valid inputs' do
    sign_in
    visit new_contribution_path
    fill_in 'contribution_ContributionType', with: 'Bao Type'
    click_on 'Create Contribution'
    visit contributions_path
    expect(page).to have_content('Bao Type')
  end
end

RSpec.describe 'Accessing projects index page', type: :feature do
  scenario 'as an admin' do
    sign_in
    expect(page).to have_content('New Project')
  end

  scenario 'as a user' do
    visit projects_path
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
end
