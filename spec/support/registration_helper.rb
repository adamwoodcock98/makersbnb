module RegistrationHelper
  def create_default_user
    User.create(
      first_name: 'Bruce',
      last_name: 'Wayne',
      user_name: 'TheBatman',
      email: 'bats@example.com',
      password: 'TheJokerSmells',
    )
  end
  
  def sign_in
    visit('/')
    click_on 'Sign in'
    fill_in 'email', with: 'bats@example.com'
    fill_in 'password', with: 'TheJokerSmells'
    find('#create_new_session').click_button('Sign in')
    visit('/')
  end
end
