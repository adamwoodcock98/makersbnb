feature 'User Registration' do
  scenario 'user can create an account' do
    visit('/users/new')
    fill_in 'first_name', with: 'Bruce'
    fill_in 'last_name', with: 'Waynee'
    fill_in 'user_name', with: 'Batman'
    fill_in 'email', with: 'batman@example.com'
    fill_in 'password', with: 'TheChosen'
    click_on 'Register'
    expect(page).to have_content 'Welcome Bruce Waynee, your username is Batman!'
  end
end