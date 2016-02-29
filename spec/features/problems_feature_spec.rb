require 'rails_helper'

feature 'Problems' do
  scenario 'should display a problems header' do
    visit '/'
    expect(page).to have_content('Problems')
  end
end
