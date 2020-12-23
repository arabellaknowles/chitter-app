feature 'user can sign up' do
  scenario 'user visits home page clicks button for sign up and is redirected to sign up form' do
    visit('/')
    click_on('Sign up')
    expect(page).to have_content('Username:')
    expect(page).to have_content('Email:')
  end
  scenario 'user fills in registration form and registers' do
    visit('/')
    click_on('Sign up')
    fill_in 'username', with: 'javascriptFanGirl'
    fill_in 'email', with: 'JSLover@gmail.com'
    fill_in 'full_name', with: 'Jane Doe'
    fill_in 'password', with: 'Dogs 4 life'
    click_on 'Register'
    expect(page).to have_content('Successfully signed up')
  end
end