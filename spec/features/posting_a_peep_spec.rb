feature 'user visits homepage' do
  scenario 'user sees homepage with Chitter header' do
    visit('/')
    expect(page).to have_content('Welcome to Chitter')
  end
  scenario 'user can see textbox for peep on homepage' do
    visit('/')
    expect(page).to have_content('Make a peep')
  end
  scenario 'user creates a peep and is redirected to homepage' do
    visit('/')
    fill_in 'peep_text', with: 'Day 44 of lockdown, still no loo roll'
    click_on 'Post'
    expect(page).to have_content('Successfully posted')
  end
end