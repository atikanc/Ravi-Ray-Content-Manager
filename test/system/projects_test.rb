require 'application_system_test_case'

class ProjectsTest < ApplicationSystemTestCase
  before do
    @project = projects(:one)
  end

  test 'visiting the index' do
    visit projects_url
    assert_selector 'h1', text: 'Projects'
  end

  test 'creating a Project' do
    visit projects_url
    click_on 'New Project'

    fill_in 'Awardid', with: @project.AwardID
    fill_in 'Awardedid', with: @project.AwardedID
    fill_in 'Contributionid', with: @project.ContributionID
    fill_in 'Displaylineid', with: @project.DisplayLineID
    fill_in 'Projectdescription', with: @project.ProjectDescription
    fill_in 'Projectend', with: @project.ProjectEnd
    fill_in 'Projectlink', with: @project.ProjectLink
    fill_in 'Projectname', with: @project.ProjectName
    fill_in 'Projectowner', with: @project.ProjectOwner
    fill_in 'Projectstart', with: @project.ProjectStart
    fill_in 'Typeid', with: @project.TypeID
    click_on 'Create Project'

    assert_text 'Project was successfully created'
    click_on 'Back'
  end

  test 'updating a Project' do
    visit projects_url
    click_on 'Edit', match: :first

    fill_in 'Awardid', with: @project.AwardID
    fill_in 'Awardedid', with: @project.AwardedID
    fill_in 'Contributionid', with: @project.ContributionID
    fill_in 'Displaylineid', with: @project.DisplayLineID
    fill_in 'Projectdescription', with: @project.ProjectDescription
    fill_in 'Projectend', with: @project.ProjectEnd
    fill_in 'Projectlink', with: @project.ProjectLink
    fill_in 'Projectname', with: @project.ProjectName
    fill_in 'Projectowner', with: @project.ProjectOwner
    fill_in 'Projectstart', with: @project.ProjectStart
    fill_in 'Typeid', with: @project.TypeID
    click_on 'Update Project'

    assert_text 'Project was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Project' do
    visit projects_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Project was successfully destroyed'
  end
end
