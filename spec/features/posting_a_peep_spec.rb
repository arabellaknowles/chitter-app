feature 'posting a peep' do
  scenario 'user creates a peep and is redirected to homepage with flash message' do
    visit('/')
    click_on('Sign up')
    fill_in 'username', with: 'javascriptFanGirl'
    fill_in 'email', with: 'JSLover@gmail.com'
    fill_in 'full_name', with: 'Jane Doe'
    fill_in 'password', with: 'Dogs 4 life'
    click_on 'Register'
    fill_in 'peep_text', with: 'Day 44 of lockdown, still no loo roll'
    click_on 'Post'
    expect(page).to have_content('Welcome to Chitter')
    expect(page).to have_content('Successfully posted')
  end
end