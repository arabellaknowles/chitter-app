feature 'deleting peeps' do
  scenario 'signed up user can their post' do
    visit('/')
    click_on('Sign up')
    user_sign_up(
      username: 'javascriptFanGirl', 
      email: 'JSLover@gmail.com', 
      full_name: 'Jane Doe', 
      password: 'Dogs 4 life'
    )
    post_peep
    click_on 'Delete'
    expect(page).to have_content('Welcome to Chitter')
    expect(page).to_not have_content('Day 44 of lockdown, still no loo roll')
  end

  scenario 'user cannot see delete button if post does not belong to them' do
    visit('/')
    click_on('Sign up')
    user_sign_up(
      username: 'javascriptFanGirl', 
      email: 'JSLover@gmail.com', 
      full_name: 'Jane Doe', 
      password: 'Dogs 4 life'
    )
    post_peep
    click_on 'Sign out'
    click_on('Sign up')
    user_sign_up(
      username: 'javacryptFanGirl', 
      email: 'JSH8er@gmail.com', 
      full_name: 'Joe Doe', 
      password: 'Cats 4 life'
    )
    expect(page).to_not have_button('Delete')
  end
end