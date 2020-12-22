feature 'viewing peeps' do
  scenario 'user visits homepage and sees peeps' do
    Peep.create(peep: 'Pretty nice weather IMO')
    visit('/')
    expect(page).to have_content('Pretty nice weather IMO')
  end
end