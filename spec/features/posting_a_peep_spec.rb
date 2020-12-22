feature 'user visits homepage' do
  scenario 'user sees homepage with Chitter header' do
    visit('/')
    expect(page).to have_content('Chitter')
  end
end