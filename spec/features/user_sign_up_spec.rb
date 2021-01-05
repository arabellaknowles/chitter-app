feature 'user can sign up' do
  scenario 'user fills in registration form and registers' do
    visit('/')
    click_on('Sign up')
    user_sign_up(
      username: 'javascriptFanGirl', 
      email: 'JSLover@gmail.com', 
      full_name: 'Jane Doe', 
      password: 'Dogs 4 life'
    )
    expect(page).to have_content('Successfully signed up')
    expect(page).to_not have_button('Sign up')
    expect(page).to_not have_button('Sign in')
  end
end