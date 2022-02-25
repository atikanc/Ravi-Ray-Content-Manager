require 'test_helper'

class AwardedsControllerTest < ActionDispatch::IntegrationTest
  before do
    @awarded = awardeds(:one)
  end

  test 'should get index' do
    get awardeds_url
    assert_response :success
  end

  test 'should get new' do
    get new_awarded_url
    assert_response :success
  end

  test 'should create awarded' do
    assert_difference('Awarded.count') do
      post awardeds_url, params: { awarded: { AwardID: @awarded.AwardID, AwardedDate: @awarded.AwardedDate, ProjectID: @awarded.ProjectID } }
    end

    assert_redirected_to awarded_url(Awarded.last)
  end

  test 'should show awarded' do
    get awarded_url(@awarded)
    assert_response :success
  end

  test 'should get edit' do
    get edit_awarded_url(@awarded)
    assert_response :success
  end

  test 'should update awarded' do
    patch awarded_url(@awarded), params: { awarded: { AwardID: @awarded.AwardID, AwardedDate: @awarded.AwardedDate, ProjectID: @awarded.ProjectID } }
    assert_redirected_to awarded_url(@awarded)
  end

  test 'should destroy awarded' do
    assert_difference('Awarded.count', -1) do
      delete awarded_url(@awarded)
    end

    assert_redirected_to awardeds_url
  end
end
