feature 'user visits homepage' do
  scenario 'user sees homepage with Chitter header' do
    visit('/')
    expect(page).to have_content('Chitter')
  end
  scenario 'user can see textbox for peep on homepage' do
    visit('/')
    expect(page).to have_content('Make a peep')
  end
end