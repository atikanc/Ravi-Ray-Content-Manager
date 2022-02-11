require "application_system_test_case"

class AwardedsTest < ApplicationSystemTestCase
  setup do
    @awarded = awardeds(:one)
  end

  test "visiting the index" do
    visit awardeds_url
    assert_selector "h1", text: "Awardeds"
  end

  test "creating a Awarded" do
    visit awardeds_url
    click_on "New Awarded"

    fill_in "Awardid", with: @awarded.AwardID
    fill_in "Awardeddate", with: @awarded.AwardedDate
    fill_in "Projectid", with: @awarded.ProjectID
    click_on "Create Awarded"

    assert_text "Awarded was successfully created"
    click_on "Back"
  end

  test "updating a Awarded" do
    visit awardeds_url
    click_on "Edit", match: :first

    fill_in "Awardid", with: @awarded.AwardID
    fill_in "Awardeddate", with: @awarded.AwardedDate
    fill_in "Projectid", with: @awarded.ProjectID
    click_on "Update Awarded"

    assert_text "Awarded was successfully updated"
    click_on "Back"
  end

  test "destroying a Awarded" do
    visit awardeds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Awarded was successfully destroyed"
  end
end
