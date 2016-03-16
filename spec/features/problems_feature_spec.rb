require 'rails_helper'

feature 'Problems Features.' do
  context 'Given the database contains some problems.' do
    before :each do
      FactoryGirl.create(:problem, title: 'A Big Big Problem')
      FactoryGirl.create(:problem, title: 'A Teeny Tiny Problem')
    end

    context 'When a user has visited the problems page.' do
      before :each do
        visit '/problems'
      end

      scenario 'Then user should see a list of problem links' do
        within 'ul#problems' do
          expect(page).to have_link 'A Big Big Problem'
          expect(page).to have_link 'A Teeny Tiny Problem'
        end
      end
    end
  end
end
