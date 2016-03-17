require 'rails_helper'

feature 'Solutions Features.' do
  context 'Given the database contains some solutions.' do
    let!(:problem) { FactoryGirl.create(:problem) }
    before :each do
      FactoryGirl.create(:solution, title: 'A great idea', problem: problem,
                         description: 'A thrilling description')
      FactoryGirl.create(:solution, title: 'Another epic idea', problem: problem)
    end

    context 'When a user is on the problem page with solutions.' do
      before :each do
        visit problem_path(problem)
      end

      scenario 'Then the user should see links to the suggested solutions' do
        within 'ul#solutions' do
          expect(page).to have_link 'A great idea'
          expect(page).to have_link 'Another epic idea'
        end
      end

      scenario 'Then the user should be able to create a solution' do
        within 'form.new_solution' do
          fill_in 'solution_title', with: 'My lovely solution'
          fill_in 'solution_description', with: 'Here is my description'
          click_button 'Create Solution'
        end
        expect(current_path).to eq problem_path(problem)
        within 'ul#solutions' do
          expect(page).to have_link 'My lovely solution'
        end
      end
    end

    context 'When a user has clicked through to a specific solution' do
      before :each do
        visit problem_path(problem)
        click_link 'A great idea'
      end

      scenario 'Then user should see details for that solution' do
        within 'section#solution' do
          expect(page).to have_content problem.title
          expect(page).to have_content 'A great idea'
          expect(page).to have_content 'A thrilling description'
        end
      end
    end
  end
end
