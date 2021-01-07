feature 'editing peeps' do
  scenario 'user can see edit button on their peep' do
    visit('/')
    click_on('Sign up')
    user_sign_up(
      username: 'javascriptFanGirl', 
      email: 'JSLover@gmail.com', 
      full_name: 'Jane Doe', 
      password: 'Dogs 4 life'
    )
    post_peep
    expect(page).to have_button 'Edit'
  end
end