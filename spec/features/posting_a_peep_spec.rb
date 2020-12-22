feature 'user visits homepage' do
  scenario 'user creates a peep and is redirected to homepage' do
    visit('/')
    fill_in 'peep_text', with: 'Day 44 of lockdown, still no loo roll'
    click_on 'Post'
    expect(page).to have_content('Successfully posted')
  end
end