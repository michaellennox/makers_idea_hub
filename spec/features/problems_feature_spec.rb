require 'rails_helper'

feature 'Problems Features' do
  context 'Given the database contains some problems' do
    before :each do
      FactoryGirl.create(:problem, title: 'A Big Big Problem',
                                   description: 'A brilliant description')
      FactoryGirl.create(:problem, title: 'A Teeny Tiny Problem')
    end

    context 'When a user has visited the problems page' do
      before :each do
        visit problems_path
      end

      scenario 'Then user should see a list of problem links' do
        within 'ul#problems' do
          expect(page).to have_link 'A Big Big Problem'
          expect(page).to have_link 'A Teeny Tiny Problem'
        end
      end

      scenario 'Then user should be able to create a new problem' do
        within 'form.new_problem' do
          fill_in 'problem_title', with: 'A New Problem'
          fill_in 'problem_description', with: 'A beautiful description'
          click_button 'Create Problem'
        end
        expect(current_path).to eq problems_path
        within 'ul#problems' do
          expect(page).to have_link 'A New Problem'
        end
      end
    end

    context 'When a user has clicked through to a specific problem' do
      before :each do
        visit problems_path
        click_link 'A Big Big Problem'
      end

      scenario 'Then user should see the details for that problem' do
        within 'section#problem' do
          expect(page).to have_content 'A Big Big Problem'
          expect(page).to have_content 'A brilliant description'
        end
      end
    end
  end
end
