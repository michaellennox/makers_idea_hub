require 'rails_helper'

feature 'Problems Features.' do
  context 'Given the database contains some problems.' do
    before :each do
      problem = FactoryGirl.create(:problem, title: 'A Big Big Problem',
                                   description: 'A brilliant description')
      FactoryGirl.create(:problem, title: 'A Teeny Tiny Problem')
      FactoryGirl.create(:solution, title: 'A great idea', problem: problem)
      FactoryGirl.create(:solution, title: 'Another epic idea', problem: problem)
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

      scenario 'Then user should be able to create a new problem' do
        within 'form.new_problem' do
          fill_in 'problem_title', with: 'A New Problem'
          fill_in 'problem_description', with: 'A beautiful description'
          click_button 'Create Problem'
        end
        within 'ul#problems' do
          expect(page).to have_link 'A New Problem'
        end
      end
    end

    context 'When a user has clicked through to a specific problem.' do
      before :each do
        visit '/problems'
        click_link 'A Big Big Problem'
      end

      scenario 'Then user should see the details for that problem' do
        within 'section#problem' do
          expect(page).to have_content 'A Big Big Problem'
          expect(page).to have_content 'A brilliant description'
        end
      end

      scenario 'Then the user should see links to the suggested solutions' do
        within 'ul#solutions' do
          expect(page).to have_link 'A great idea'
          expect(page).to have_link 'Another epic idea'
        end
      end
    end
  end
end
