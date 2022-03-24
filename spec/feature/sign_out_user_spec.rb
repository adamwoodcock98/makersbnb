feature 'Sign out' do
  before do
    User.create(
      first_name: 'Bruce',
      last_name: 'Wayne',
      user_name: 'TheBatman',
      email: 'bats@example.com',
      password: 'TheJokerSmells',
    )
  end

  scenario 'User can sign out' do
    visit('/sessions/new')
    fill_in 'email', with: 'bats@example.com'
    fill_in 'password', with: 'TheJokerSmells'
    click_button('Sign in')
    expect(page).to have_content('You have signed in correctly')
    expect(page).to have_button('Sign out')
    click_button('Sign out')
    expect(page).to have_content('You have signed out')
    # save_and_open_page
    # print page.html
  end
end