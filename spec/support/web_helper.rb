def create_user_and_sign_in
  User.create(
    first_name: 'Bruce',
    last_name: 'Wayne',
    user_name: 'TheBatman',
    email: 'bats@example.com',
    password: 'TheJokerSmells',
  )

  visit('/sessions/new')
    fill_in 'email', with: 'bats@example.com'
    fill_in 'password', with: 'TheJokerSmells'
    find('#create_new_session').click_button('Sign in')
end