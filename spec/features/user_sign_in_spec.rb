feature 'signing in' do
  scenario 'user signs in and sees welcome message' do
    User.create(
      username: 'javascriptFanGirl',
      email: 'JSLover@gmail.com',
      full_name: 'Jane Doe',
      password: 'ILoveDogs'
    )
    visit('/')
    click_on 'Sign in'
    fill_in 'username', with: 'javascriptFanGirl'
    fill_in 'password', with: 'ILoveDogs'
    click_on 'Sign in'
    expect(page).to have_content('Welcome, Jane')
    # test passing even though this is not true
  end
end