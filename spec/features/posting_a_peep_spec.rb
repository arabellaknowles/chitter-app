feature 'posting a peep' do
  scenario 'user creates a peep and is redirected to homepage with flash message' do
    visit('/')
    click_on('Sign up')
    user_sign_up(
      username: 'javascriptFanGirl', 
      email: 'JSLover@gmail.com', 
      full_name: 'Jane Doe', 
      password: 'Dogs 4 life'
    )
    post_peep
    expect(page).to have_content('Welcome to Chitter')
    expect(page).to have_content('Successfully posted')
  end
end