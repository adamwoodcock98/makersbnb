feature 'Sign out' do
  before do
    create_user_and_sign_in
  end

  scenario 'User can sign out' do
    expect(page).to have_content('You have signed in correctly')
    expect(page).to have_button('Sign out')
    click_button('Sign out')
    expect(page).to have_content('You have signed out')
  end
end