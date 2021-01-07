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
    expect(page).to have_content('Day 44 of lockdown, still no loo roll')
  end
end