feature 'posting a peep' do
  scenario 'user creates a peep and is redirected to homepage with flash message' do
    visit('/')
    fill_in 'peep_text', with: 'Day 44 of lockdown, still no loo roll'
    click_on 'Post'
    expect(page).to have_content('Welcome to Chitter')
    expect(page).to have_content('Successfully posted')
  end
end