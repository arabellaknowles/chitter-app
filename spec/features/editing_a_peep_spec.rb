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
    click_on 'Edit'
    fill_in 'peep_text', with: 'An updated message'
    click_on 'Update'
    expect(page).to have_content('Welcome to Chitter')
    expect(page).to have_content('An updated message')
  end
end