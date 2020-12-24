feature 'signing in' do 
  scenario 'user visits home page clicks button for sign in and is redirected to sign in form' do
    visit('/')
    click_on('Sign in')
    expect(page).to have_content('Username:')
    expect(page).to have_content('Password:')
  end
end