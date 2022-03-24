feature 'Sign In' do
  before do
    User.create(
      first_name: 'Bruce',
      last_name: 'Wayne',
      user_name: 'TheBatman',
      email: 'bats@example.com',
      password: 'TheJokerSmells',
    )
  end

  scenario 'when a user provides correct details they can sign-in' do
    visit('/listings')
    expect(page).to have_button('Sign in')
    click_button('Sign in')
    fill_in 'email', with: 'bats@example.com'
    fill_in 'password', with: 'TheJokerSmells'
    find('#create_new_session').click_button('Sign in')
    expect(page).to have_content('You have signed in correctly')
  end
  scenario 'when a user provides incorrect details they cannot sign-in' do
    visit('/listings')
    expect(page).to have_button('Sign in')
    click_button('Sign in')
    fill_in 'email', with: 'gary@example.com'
    fill_in 'password', with: 'ItsBritney'
    find('#create_new_session').click_button('Sign in')
    expect(page).to have_content('Please check your email and password')
  end
end