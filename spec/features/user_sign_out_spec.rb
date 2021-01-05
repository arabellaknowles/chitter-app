feature 'user can sign out' do
  scenario 'user signs in then signs out and sees flash success message' do
    User.create(
      username: 'javascriptFanGirl',
      email: 'JSLover@gmail.com',
      full_name: 'Jane Doe',
      password: 'ILoveDogs'
    )
    visit('/')
    click_on 'Sign in'
    user_sign_in(username: 'javascriptFanGirl', password: 'ILoveDogs')
    click_on 'Sign out'
    expect(page).to have_content 'Successfully signed out, see you soon!'
    expect(page).to have_button 'Sign in'
  end
end