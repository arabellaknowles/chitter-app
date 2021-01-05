feature 'user can sign up' do
  before do
    visit('/')
    click_on('Sign up')
  end
  scenario 'user fills in registration form and registers' do
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

  scenario 'user fills in registration form with invalid email and receives error message' do
    user_sign_up(
      username: 'javascriptFanGirl', 
      email: 'JSLovergmail.com', 
      full_name: 'Jane Doe', 
      password: 'Dogs 4 life'
    )
    expect(page).to have_content('Invalid email, please try again')
  end
end