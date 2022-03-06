require 'application_system_test_case'

class DisplayLinesTest < ApplicationSystemTestCase
  before do
    @display_line = display_lines(:one)
  end

  test 'visiting the index' do
    visit display_lines_url
    assert_selector 'h1', text: 'Display Lines'
  end

  test 'creating a Display line' do
    visit display_lines_url
    click_on 'New Display Line'

    fill_in 'Componentcontributed', with: @display_line.ComponentContributed
    fill_in 'Componentenddate', with: @display_line.ComponentEndDate
    fill_in 'Componentstartdate', with: @display_line.ComponentStartDate
    fill_in 'Contribprojectid', with: @display_line.ContribProjectID
    fill_in 'Contribtype', with: @display_line.ContribType
    click_on 'Create Display line'

    assert_text 'Display line was successfully created'
    click_on 'Back'
  end

  test 'updating a Display line' do
    visit display_lines_url
    click_on 'Edit', match: :first

    fill_in 'Componentcontributed', with: @display_line.ComponentContributed
    fill_in 'Componentenddate', with: @display_line.ComponentEndDate
    fill_in 'Componentstartdate', with: @display_line.ComponentStartDate
    fill_in 'Contribprojectid', with: @display_line.ContribProjectID
    fill_in 'Contribtype', with: @display_line.ContribType
    click_on 'Update Display line'

    assert_text 'Display line was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Display line' do
    visit display_lines_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Display line was successfully destroyed'
  end
end
