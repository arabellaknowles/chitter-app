feature 'signing in' do
  before do
    User.create(
      username: 'javascriptFanGirl',
      email: 'JSLover@gmail.com',
      full_name: 'Jane Doe',
      password: 'ILoveDogs'
    )
    visit('/')
    click_on 'Sign in'
  end

  scenario 'user signs in and sees welcome message' do
    user_sign_in(username: 'javascriptFanGirl', password: 'ILoveDogs')
    expect(page).to have_content('Welcome, Jane')
    expect(page).to_not have_button('Sign up')
    expect(page).to_not have_button('Sign in')
  end

  scenario 'user signs in with invalid credentials and sees error message' do
    user_sign_in(username: 'javascriptFanMan', password: 'ILoveDogs')
    expect(page).to have_content('Sign in failed, please try again')
  end
end