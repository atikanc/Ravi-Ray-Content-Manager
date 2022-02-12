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

  RSpec.describe 'Creating a contribution type', type: :feature do
    scenario 'valid inputs' do
      visit new_contribution_path
      fill_in 'Contributiontype', with: 'Bao Type'
      click_on 'Create Contribution'
      visit contributions_path
      expect(page).to have_content('Bao Type')
    end
  end
  