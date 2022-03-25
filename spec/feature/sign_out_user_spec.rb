feature 'Sign out' do
  before do
    create_default_user
  end

  scenario 'User can sign out' do
    visit('/')
    click_on 'Sign in'
    fill_in 'email', with: 'bats@example.com'
    fill_in 'password', with: 'TheJokerSmells'
    find('#create_new_session').click_button('Sign in')
    expect(page).to have_content('You have signed in correctly')
    expect(page).to have_button('Sign out')
    click_button('Sign out')
    expect(page).to have_content('You have signed out')
  end
end