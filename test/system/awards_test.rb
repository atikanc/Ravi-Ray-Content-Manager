require 'application_system_test_case'

class AwardsTest < ApplicationSystemTestCase
  before do
    @award = awards(:one)
  end

  test 'visiting the index' do
    visit awards_url
    assert_selector 'h1', text: 'Awards'
  end

  test 'creating a Award' do
    visit awards_url
    click_on 'New Award'

    fill_in 'Awardlink', with: @award.AwardLink
    fill_in 'Awardname', with: @award.AwardName
    fill_in 'Awardyear', with: @award.AwardYear
    click_on 'Create Award'

    assert_text 'Award was successfully created'
    click_on 'Back'
  end

  test 'updating a Award' do
    visit awards_url
    click_on 'Edit', match: :first

    fill_in 'Awardlink', with: @award.AwardLink
    fill_in 'Awardname', with: @award.AwardName
    fill_in 'Awardyear', with: @award.AwardYear
    click_on 'Update Award'

    assert_text 'Award was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Award' do
    visit awards_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Award was successfully destroyed'
  end
end
