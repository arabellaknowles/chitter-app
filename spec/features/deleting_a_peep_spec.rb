feature 'deleting peeps' do
  scenario 'signed up user can see delete button on their posts' do
    visit('/')
    click_on('Sign up')
    user_sign_up(
      username: 'javascriptFanGirl', 
      email: 'JSLover@gmail.com', 
      full_name: 'Jane Doe', 
      password: 'Dogs 4 life'
    )
    post_peep
    expect(page).to have_button('Delete')
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