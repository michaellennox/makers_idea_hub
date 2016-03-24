require 'rails_helper'

feature 'Replies Features' do
  context 'Given the database contains some replies' do
    let!(:solution) { FactoryGirl.create(:solution) }
    before :each do
      FactoryGirl.create(:reply, body: 'I think this idea sucks', solution: solution)
      FactoryGirl.create(:reply, body: 'But I think it\'s great', solution: solution)
    end

    context 'When a user has visited the solution page' do
      before :each do
        visit solution_path(solution)
      end

      scenario 'Then user should see a list of replies to the solution' do
        within 'ul#replies' do
          expect(page).to have_content 'I think this idea sucks'
          expect(page).to have_content 'But I think it\'s great'
        end
      end

      scenario 'Then user should be able to create a new reply' do
        within 'form.new_reply' do
          fill_in 'reply_body', with: 'I also think cookies are the answer'
          click_button 'Create Reply'
        end
        expect(current_path).to eq solution_path(solution)
        within 'ul#replies' do
          expect(page).to have_conten 'I also think cookies are the answer'
        end
      end
    end
  end
end
