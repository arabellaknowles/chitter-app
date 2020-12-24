feature 'viewing peeps' do
  scenario 'user visits homepage and sees peeps' do
    Peep.create(peep: 'Pretty nice weather IMO')
    visit('/')
    expect(page).to have_content('Pretty nice weather IMO')
  end

  scenario 'user cannot see peep creation form if not signed up' do
    visit('/')
    expect(page).to_not have_content('Make a peep:')
  end

  scenario 'user can view what time each peep was made' do
    @time_now = Time.now.strftime("%k:%M")
    allow(Peep).to receive(:current_time).and_return(@time_now)    
    Peep.create(peep: 'Pretty nice weather IMO')
    visit('/')
    expect(page).to have_content(@time_now)
  end
end