feature 'user can sign up' do
  scenario 'user visits home page clicks button for sign up and is redirected to sign up form' do
    visit('/')
    click_on('Sign up')
    expect(page).to have_content('Username:')
  end
end