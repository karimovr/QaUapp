require 'rails_helper'

feature 'Create question', %q{
  In order to get answer from community
  As authenticated user
  I want be able to ask question
} do
  given!(:user) { create(:user) }
  scenario 'Authenticated user create question' do
    login(user)
    visit questions_path
    click_on 'Ask question'
    fill_in 'Title', with: 'Test question'
    fill_in 'Text', with: 'Text body'
    click_on 'Create'

    expect(page).to have_content 'Your question successfully created'
    expect(page).to have_content 'Test question'
    expect(page).to have_content 'Text body'
  end
  scenario 'Non-authenticated user try to create question' do
    visit questions_path

    click_on 'Ask question'

    expect(page).to have_content 'You need to sign in or sign up before continuing.'
    expect(current_path).to eq new_user_session_path
  end
end